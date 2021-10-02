using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure;
using Microsoft.Azure.Cosmos.Table;
using Microsoft.Azure.Documents;

namespace ArduinoCommunicationClient.Azure
{
    public class DbManager
    {
        const string ConnectionString = "DefaultEndpointsProtocol=https;AccountName=crgariotdemosstorage;AccountKey=OiIGkcauWbiQCZyzEudpQSNmMbILzM7CKmkkpin4Q9v2qlxcEfWqi1zjDuU487ejxWLCz26GuLFMfljUE0qFJw==;EndpointSuffix=core.windows.net";
        const string TableName = "HumidityEntities";

        public async Task StoreNewRecord(DateTime dateTime, int value)
        {
            CloudTable table = await GetTableAsync(TableName);
            await InsertOrMergeEntityAsync(table, new HumidityMeasurementEntity(dateTime, value));

        }

        private CloudStorageAccount CreateStorageAccountFromConnectionString(string storageConnectionString)
        {
            CloudStorageAccount storageAccount;
            try
            {
                storageAccount = CloudStorageAccount.Parse(storageConnectionString);
            }
            catch (FormatException)
            {
                Console.WriteLine("Invalid storage account information provided. Please confirm the AccountName and AccountKey are valid in the app.config file - then restart the application.");
                throw;
            }
            catch (ArgumentException)
            {
                Console.WriteLine("Invalid storage account information provided. Please confirm the AccountName and AccountKey are valid in the app.config file - then restart the sample.");
                Console.ReadLine();
                throw;
            }

            return storageAccount;
        }

        private async Task<CloudTable> GetTableAsync(string tableName)
        {
            // Retrieve storage account information from connection string.
            CloudStorageAccount storageAccount = CreateStorageAccountFromConnectionString(ConnectionString);

            // Create a table client for interacting with the table service
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient(new TableClientConfiguration());

            // Create a table client for interacting with the table service 
            CloudTable table = tableClient.GetTableReference(tableName);
            //if (await table.CreateIfNotExistsAsync())
            //{
            //    Console.WriteLine("Created Table named: {0}", tableName);
            //}
            //else
            //{
            //    Console.WriteLine("Table {0} already exists", tableName);
            //}

            Console.WriteLine();
            return table;
        }

        private static async Task<HumidityMeasurementEntity> InsertOrMergeEntityAsync(CloudTable table, HumidityMeasurementEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            try
            {
                // Create the InsertOrReplace table operation
                TableOperation insertOrMergeOperation = TableOperation.InsertOrMerge(entity);

                // Execute the operation.
                TableResult result = await table.ExecuteAsync(insertOrMergeOperation);
                HumidityMeasurementEntity insertedCustomer = result.Result as HumidityMeasurementEntity;

                // Get the request units consumed by the current operation. RequestCharge of a TableResult is only applied to Azure Cosmos DB
                if (result.RequestCharge.HasValue)
                {
                    Console.WriteLine("Request Charge of InsertOrMerge Operation: " + result.RequestCharge);
                }

                return insertedCustomer;
            }
            catch (StorageException e)
            {
                Console.WriteLine(e.Message);
                Console.ReadLine();
                throw;
            }
        }
    }
}
