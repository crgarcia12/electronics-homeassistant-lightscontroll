using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArduinoCommunicationClient.Azure
{
    using Microsoft.Azure.Cosmos.Table;
    using Microsoft.OData.Edm;

    public class HumidityMeasurementEntity : TableEntity
    {
        public string Value { get; set; }
        public string RecordDateTime { get; set; }

        public HumidityMeasurementEntity()
        {
        }

        public HumidityMeasurementEntity(DateTime datetime, int value)
        {
            RecordDateTime = datetime.ToString("yyyy-MM-dd HH:mm:ss");
            Value = value.ToString();
            PartitionKey = "measurements";
            RowKey = RecordDateTime;
        }
    }
}
