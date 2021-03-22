package bdbt_proj;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;



@Configuration 
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
    @Override
    public UserDetailsService userDetailsService() {
        UserDetails normalUser =
                User.withUsername("user")
                        .password("{noop}password")
                        .roles("USER_ROLE")
                        .build();

        // admin user with all privileges
        UserDetails adminUser =
                User.withUsername("admin")
                        .password("{noop}password")
                        .roles("ADMIN_ROLE")
                        .build();

        return new InMemoryUserDetailsManager(normalUser, adminUser);

    }
 
	
	@Override
    protected void configure(HttpSecurity http) throws Exception{
        http.authorizeRequests()
        		.antMatchers("/admin","/positions","/factories","/addresses","/add_address","/add_employee,"
        				+ "add_factory, add_position, edit_address_form, edit_factory_form, edit_form"
        				+ "edit_position_form").hasRole("ADMIN_ROLE")
        		.antMatchers("/user").hasRole("USER_ROLE")
        		.antMatchers("/","/style.css","/background.png").permitAll().anyRequest()
                .authenticated()
                .and().formLogin()          
                .and().logout().permitAll();

    }
	
	
  
}