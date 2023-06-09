'''
pip install pyarrow

'''
import io
import pyarrow
import pyarrow.csv as pacsv

# Reading from the file
source = '/workspaces/sample_data/data/ontime_2006_11.csv'

pa_table = pacsv.read_csv(source)
# print(pa_table)


# write to arrow file
with open('/workspaces/sample_data/data/ontime_2006_11.arrow', 'wb') as f:
    writer = pyarrow.RecordBatchFileWriter(f, pa_table.schema)
    writer.write_table(pa_table)
    writer.close()