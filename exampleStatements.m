clear;
clc;

% Create the connection with the ODBC connector previously created database in "databaseExplorer"
conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');

% Assign values ​​to a table and select all columns to use
adminData = table("root","root123", "admin", "First Admin User", "admin@email.com", ...
            'VariableNames', {'username', 'password', 'type', 'name', 'email'});
basicData = table("basicUser","pass123", "basic", "First Basic User", "basic@email.com", ...
            'VariableNames', {'username', 'password', 'type', 'name', 'email'});

% Statement to execute a Sql Write to database in order: Connection, Table, Values
sqlwrite(conn, 'User', adminData);
sqlwrite(conn, 'User', basicData);
%% Statements to get all columns of the table
% Statement to execute a select on table User
userValue = sqlread(conn, 'User');
%% Statements to get specific columns and add WHERE to Query
% Prepare the query sentence 
query = strcat("SELECT password, type FROM User ", ...
    "WHERE username = 'root'");
rslt = fetch(conn, query);
%% Close connection
close(conn);

