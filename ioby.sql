/*
Create a new, basic account, providing the requirement data elements and a few 
optional ones.  The procedure should take as input values for the account’s 
attributes and insert them into the table used to store data about accounts.  
Values for the account email, account password, and account type should not be 
NULL.  The account type value should conform to this attribute’s domain {‘Group 
or organization’, ‘Individual’}.  The procedure should be able to handle cases 
where alternative capitalization is used for these values (e.g. ‘individual’, 
‘Group or Organization’).  If an account with the same email address has already 
been created, raise an exception with the appropriate message and do not create 
the account.  The procedure should create a new value for account_id and return 
it.  As an optional bonus requirement, can you verify that the email address has 
the format of an email address? (Hint:  Regular expressions are helpful for this 
sort of pattern matching.)
*/
create or replace procedure CREATE_ACCOUNT_SP (
  p_account_id      OUT INTEGER,
  p_email           IN VARCHAR,   -- must not be NULL
  p_password        IN VARCHAR,   -- must not be NULL
  p_location_name   IN VARCHAR,   -- must not be NULL
  p_account_type    IN VARCHAR,   -- should have value of 'Group or organization' or 'Individual'
  p_first_name      IN VARCHAR,
  p_last_name       IN VARCHAR
)
IS
BEGIN
    NULL;
END;
/

/*
Create a new project in the system.  The procedure should take as input values 
for the project’s attributes and insert them into the table used to store data 
about projects.  Values for the project title, goal, deadline, creation date, 
description, city, state, postal code, and status are required.  The default 
value for status (if none is provided) is ‘Submitted’.  The project must also be 
associated with an existing account.  If the account_id value provided does not 
match an existing account, an appropriate error message should be shown and no 
project should be inserted.  The value of the goal should be greater or equal to 
zero.  If no creation date is provided, then the current date should be used.  
The project deadline should be later than the creation date.  The project status 
values should be limited to the domain.  The volunteer need value should be in 
the domain {‘yes’, ‘no’}.  The procedure should generate a value for the project 
id and return this value.
*/
p_project_id        OUT INTEGER,
p_title             IN  VARCHcreate or replace procedure CREATE_PROJECT_SP (
AR,
p_goal              IN  NUMBER,        -- The goal should be >= zero
p_deadline          IN  DATE,
p_creation_date     IN  DATE,
p_description       IN  CLOB,
p_subtitle          IN  VARCHAR,
p_street_1          IN  VARCHAR,
p_street_2          IN  VARCHAR,
p_city              IN  VARCHAR,
P_state             IN  VARCHAR,
p_postal_code       IN  CHAR,
p_postal_extension  IN  CHAR,
p_steps_to_take     IN  CLOB,
p_motivation        IN  CLOB,
p_volunteer_need    IN  VARCHAR,  -- should be 'yes' or 'no'
p_project_status    IN  VARCHAR,  -- should be in {'Closed', 'Completed', 'Open', 'Submitted', 'Underway'}
p_account_id        IN  INTEGER   -- should match account in the account table
)
IS
BEGIN
    NULL;
END;
/
/*
Add a giving level to an existing project.  The procedure should check that the 
indicated project exists.  The giving level amount and description must not be 
NULL.  If there already exists a giving level with the same amount for the 
indicated project, this procedure should update the description with the new 
value.
*/
create or replace procedure CREATE_GIVING_LEVEL_SP (
p_projectID             IN INTEGER,
p_givingLevelAmt        IN INTEGER,   -- Must be > zero or NULL
p_givingDescription     IN NUMBER     -- Must not be NULL
)
IS
BEGIN
    NULL;
END;
/

/*
Add a budget item to an existing project.  The procedure should check that the 
indicated project exists, and generate an error message if it does not.  
The budget item description must not be NULL.  
If a budget item with the same description already exists for the project, 
then the procedure should generate an error message and not insert a duplicate 
budget line item.
*/
create or replace procedure ADD_BUDGET_ITEM_SP (
p_projectID             IN INTEGER,
p_description           IN VARCHAR,   
p_budgetAmt             IN NUMBER
)
IS
pro_ID int:= select project_id from i_budget;

BEGIN
    if (pro_ID = p_projectID) then
    insert into i_budget (budget_line_item_description, budget_line_item_amount)
    values (p_description, p_budgetAmt);
    ELSE 
    dbms_output.put_line('Project does not have a budget');
    end if;
    
END;
/

execute ADD_BUDGET_ITEM_SP(2, 'Testing', 2000);

/*
Add a website for an account.  The procedure should check that the account email, 
the URL, and the description are not NULL.  The procedure should look up the 
account id of the account that has the given email address.  If no such account
exists, the procedure should generate an error message.
*/
create or replace procedure ADD_WEBSITE_SP (
p_accountEmail          IN VARCHAR,
p_websiteOrder          IN INTEGER,  -- Must be >= zero or NULL
p_websiteTitle          IN VARCHAR,
p_websiteURL            IN VARCHAR
)
IS
BEGIN
    NULL;
END;
/

/*
Associate a focus area with a project.  The procedure should check that the 
focus area and the project id are valid.  If either is NULL or not valid, an 
appropriate error message should be generated.
*/
create or replace procedure ADD_FOCUSAREA_SP (
p_project_ID            IN INTEGER,
p_focusArea             IN VARCHAR
)
IS
BEGIN
    NULL;
END;
/

/*
Associate a focus area with a project.  The procedure should check that the 
focus area and the project id are valid.  If either is NULL or not valid, an 
appropriate error message should be generated.
*/
create or replace procedure ADD_PROJTYPE_SP (
p_project_ID            IN INTEGER,
p_projType              IN VARCHAR
)
IS
counter number;
errMsg_txt varchar(200);
ex_error exception;
BEGIN
    if p_projType is NULL THEN
    errMsg_txt := 'The input ' || p_projType || ' is NULL.';
    RAISE ex_error;
    
    elsif p_project_ID < 0 then
    errMsg_txt := 'The input parameter ' || p_project_ID || ' is negative';
    RAISE ex_error;    
    end if;
    
    select count(*)
    into counter
    from I_PROJECT
    where I_PROJECT.PROJECT_ID = p_project_ID;
    
    if counter = 0 then
    errMSG_txt := 'Project ID ' || p_project_id || ' not found.';
    RAISE ex_error;
    end if;
    
    insert into I_PROJECT_TYPE (PROJECT_TYPE_NAME)
    values (p_projType);
   
    insert into I_PROJ_PROJTYPE (PROJECT_ID, PROJECT_TYPE_NAME)
    values (p_project_ID, p_projType);
    
    COMMIT;
    
    EXCEPTION
    WHEN ex_error THEN
    DBMS_OUTPUT.PUT_LINE(errMsg_txt);
    ROLLBACK;
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('The error code is: ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('The error msg is: ' || SQLERRM);
    ROLLBACK;
END;
/


