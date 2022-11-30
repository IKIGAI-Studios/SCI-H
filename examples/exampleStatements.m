clear;
clc;

% Create the connection with the ODBC connector previously created database in "databaseExplorer"
conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');

% Assign values ​​to a table and select all columns to use
% Root Password: AdminPass123
adminData = table("root","13826550ff5ac954bb2ce9096f9a9d9d1b24df57e2c5d72a24a8ae3c5f3f0d2aaae555d6d52ae6cc72b3afb28d6cba11424351cdb5e750dc27e228f39c6535be", "admin", "First Admin User", "admin@email.com", ...
            'VariableNames', {'username', 'password', 'type', 'name', 'email'});
% Root Password: BasicPass123
basicData = table("basicUser","3cdd8bb17ff491695717d99150fd1c109afa7ca5035184c3dccabea03e818b8162129a8c4e114246aaaa3365d7ac832f2ce40a9cc6787a9f7c603b2ad961a9c8", "basic", "First Basic User", "basic@email.com", ...
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

