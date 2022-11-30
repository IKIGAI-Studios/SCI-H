n = true;
while n 
    login = string(input("Are you already singed up? y/n"));

    if("y" == login)
        user = string(input("Enter the user: "));

        Password = input("Enter the password: ");
        Password = string(DataHash(Password,'SHA-512'));
        disp(Password);
        i = 1;
        l = length(users);
        while i <= l
            if(users(i) == user)
                 if(Password == passwords(i))
                    fprintf("Logged in succesfully!");
                    n = false;
                    break;
                 else
                    fprintf("Invalid password");
                    n = false;
                    break;
                 end 
            end
            i = i + 1;
        end   

    else
        User =string(input("Enter the new user: ")); 
        try
            users = [users; User];
        catch
            users = [User];
        end
        Password = input("Enter the new password: ");
    
        Password = string(DataHash(Password,'SHA-512'));
        valid = input("Valid your password: ");
        valid = string(DataHash(valid,'SHA-512'));

       if(valid == Password)
           try
               passwords = [passwords; Password];
           catch
               passwords = [Password];
           end
           n = false;
       else 
           fprintf("invalid password");
           
       end

    end 
end
