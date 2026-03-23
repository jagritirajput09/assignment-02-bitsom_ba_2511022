const { MongoClient } = require('mongodb');
const fs = require('fs');
const path = require('path');

async function run() {
  const uri = 'mongodb://localhost:27017'; 
  const client = new MongoClient(uri);

  try {
    await client.connect();
    const db = client.db('sample_database'); 

    // OP1: Import documents from sample_documents.json
    const data = fs.readFileSync(path.join(__dirname, 'sample_documents.json'), 'utf8');
    const documents = JSON.parse(data);
    await db.collection('products').insertMany(documents);
    console.log('Documents inserted successfully');

    // OP2:
    const electronics = await db.collection('products').find({ category: "Electronics", price: { $gt: 20000 } }).toArray();
    console.log('OP2 results:', electronics);

    // OP3:
    const expiring = await db.collection('products').find({ "details.expiry": { $lt: "2025-01-01" } }).toArray();
    console.log('OP3 results:', expiring);

    // OP4:
    await db.collection('products').updateOne(
      { name: "Laptop" },
      { $set: { discount_percent: 10 } }
    );
    console.log('OP4: Laptop updated');

    /*
    OP5: Create an index on the category field to optimize queries filtering by category.
    This will speed up queries that filter products by category, such as the one in OP2.
    */
    await db.collection('products').createIndex({ category: 1 });
    console.log('OP5: Index created on category');

  } finally {
    await client.close();
  }
}

run().catch(console.dir);
