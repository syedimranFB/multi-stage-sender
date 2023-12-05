# import pyodbc

# def execute_sql_script(server, database, username, password, script_path):
#     # Define connection string
#     connection_string = f'DRIVER=ODBC Driver 17 for SQL Server;SERVER={server};DATABASE={database};UID={username};PWD={password}'

#     try:
#         # Establish a connection
#         with pyodbc.connect(connection_string) as conn:
#             # Create a cursor
#             cursor = conn.cursor()

#             # Read the SQL script content
#             with open(script_path, 'r') as script_file:
#                 sql_script = script_file.read()

#             # Execute the SQL script
#             cursor.execute(sql_script)

#             # Commit the transaction
#             conn.commit()

#             print("SQL script executed successfully.")

#     except pyodbc.Error as e:
#         print(f"Error: {str(e)}")

# # Set your Synapse Analytics connection details
# server_name = "fb-devops-test-ondemand.sql.azuresynapse.net"
# database_name = "demodb"
# username = "sqladminuser"
# password = "Welcome123#"
# script_path = "D:\Syed_Backup\FourBends\Azure_Synapse\sender-receiver-multistage\multi-stage-sender\SQL script 1.sql"  # Replace with the actual path to your SQL script

# # Call the function to execute the SQL script
# execute_sql_script(server_name, database_name, username, password, script_path)





# ---------------------------------------------------------------------------------------


import pyodbc

def execute_sql_query(server, database, username, password, query):
    # Define connection string
    connection_string = f'DRIVER=ODBC Driver 17 for SQL Server;SERVER={server};DATABASE={database};UID={username};PWD={password}'

    try:
        # Establish a connection
        with pyodbc.connect(connection_string) as conn:
            # Create a cursor
            cursor = conn.cursor()

            # Execute the SQL query
            cursor.execute(query)

            # Fetch all rows
            rows = cursor.fetchall()

            # Print the result
            for row in rows:
                print(row)

    except pyodbc.Error as e:
        print(f"Error: {str(e)}")

# Set your Synapse Analytics connection details
server_name = "fb-devops-test-ondemand.sql.azuresynapse.net"
database_name = "demodb"
username = "sqladminuser"
password = "Welcome123#"
query = "SELECT * FROM gold.TEAM"

# Call the function to execute the SQL query
execute_sql_query(server_name, database_name, username, password, query)
