package tlu.kaardirakendus.akustika.service;

import jakarta.servlet.http.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tlu.kaardirakendus.akustika.repository.UserRepository;

import java.security.Principal;

@Log4j2
@Service
@RequiredArgsConstructor
public class UserService implements IUserService {

    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public Object validateUser(OAuth2AuthenticationToken token, HttpServletRequest request, HttpServletResponse response) {
        var email = token.getPrincipal().getAttribute("email");
        var currentUser = userRepository.findByEmail((String) email);

        log.info("Before " + SecurityContextHolder.getContext().getAuthentication());
        if(currentUser != null && currentUser.getEmail().equals(email)) {
            return token.getPrincipal();
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null){
                new SecurityContextLogoutHandler().logout(request, response, auth);
            }
            SecurityContextHolder.getContext().setAuthentication(null);
        }

        log.info("After " + SecurityContextHolder.getContext().getAuthentication());
        return null;
    }

}
