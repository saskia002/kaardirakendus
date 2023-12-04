package tlu.kaardirakendus.akustika.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tlu.kaardirakendus.akustika.repository.UserRepository;

import java.util.Map;

@Log4j2
@RestController
@RequestMapping("/v1/login")
@CrossOrigin(maxAge = 3600)
@RequiredArgsConstructor
public class AuthController {

    private final UserRepository userRepository;

    @GetMapping
    public Map<String, Object> currentUser(OAuth2AuthenticationToken oAuth2AuthenticationToken) {
        return oAuth2AuthenticationToken.getPrincipal().getAttributes();
    }

}
