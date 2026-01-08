Section A: Limitations of RDBMS 

Relational databases such as MySQL are not well suited for handling highly diverse product data. In an e-commerce system, different products have different attributes—for example, laptops have RAM and processor details, while shoes have size and color. In a relational database, this requires creating many nullable columns or separate tables, leading to complex schemas.

Frequent schema changes are another limitation. Each time a new product type is introduced, the table structure must be altered, which can cause downtime and impact existing queries. Relational databases are rigid and do not adapt easily to evolving data requirements.

Additionally, storing customer reviews is difficult in an RDBMS. Reviews are naturally nested within products, but relational databases require separate tables and joins, increasing query complexity and reducing performance when retrieving product details along with reviews.



Section B: Benefits of NoSQL (MongoDB) 

MongoDB addresses these limitations through its flexible document-based schema. Each product can store different attributes without enforcing a fixed structure, making it ideal for diverse product catalogs. New attributes can be added without modifying existing documents or schemas.

MongoDB supports embedded documents, allowing customer reviews to be stored directly inside product documents. This improves performance by eliminating joins and enables faster retrieval of complete product information.

Horizontal scalability is another major advantage. MongoDB distributes data across multiple servers using sharding, allowing the system to handle large volumes of data and traffic efficiently. This makes MongoDB suitable for applications that require high scalability and flexible data modeling.



Section C: Trade-offs of MongoDB

One disadvantage of MongoDB is weaker support for complex transactions compared to relational databases. While MongoDB supports transactions, they are generally less efficient for highly relational data.

Another drawback is the lack of strict schema enforcement, which can lead to inconsistent data if not properly validated at the application level. This makes data governance more challenging compared to structured relational databases.