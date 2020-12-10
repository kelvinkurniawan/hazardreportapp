/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.providers;

import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.entities.rest.*;
import com.ksm.hazardreportapp.services.UserService;
import com.ksm.hazardreportapp.services.rest.LoginService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

/**
 *
 * @author kelvi
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    boolean shouldAuthenticateAgainstThirdPartySystem = true;

    @Autowired
    LoginService loginService;

    @Autowired
    UserService userService;

    LoginInput loginInput = new LoginInput();
    Users user = new Users();
    LoginOutput loginOutput;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName(); //email
        String password = authentication.getCredentials().toString();

        loginInput.setEmail(name);
        loginInput.setPassword(password);

        loginOutput = loginService.login(loginInput);


        //System.out.println("Email : "+ loginOutput.getUser().getEmail());

        if (loginOutput.getStatus().equalsIgnoreCase("Verified")) {

            user = userService.getByEmail(loginOutput.getUser().getEmail());

            if(!user.getId().equalsIgnoreCase(loginOutput.getUser().getId())){
                System.out.println("Local id = " + user.getId());
                System.out.println("Server id = " + loginOutput.getUser().getId());
                userService.syncLocalUserIdAndServerUserId(loginOutput.getUser().getId(), loginOutput.getUser().getEmail());
            }
            final List<GrantedAuthority> grantedAuths = new ArrayList<>();
            grantedAuths.add(new SimpleGrantedAuthority(loginOutput.getUser().getRoles().get(0)));
            final UserDetails principal = new User(name, password, grantedAuths);
            final Authentication auth = new UsernamePasswordAuthenticationToken(principal, password, grantedAuths);

            return auth;
        } else {
            return null;
        }

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
