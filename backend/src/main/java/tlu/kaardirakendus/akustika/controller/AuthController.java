package tlu.kaardirakendus.akustika.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tlu.kaardirakendus.akustika.service.IUserService;

import java.security.Principal;
import java.util.Map;

@Log4j2
@RestController
@RequestMapping("/v1/auth")
@CrossOrigin(maxAge = 3600)
@RequiredArgsConstructor
public class AuthController {

    private final IUserService userService;

    @GetMapping("/login")
    public Object currentUser(OAuth2AuthenticationToken oAuth2AuthenticationToken, HttpServletRequest request, HttpServletResponse response, Principal principal) {
        try {
            return userService.validateUser(oAuth2AuthenticationToken, request, response);
        } catch (Exception e) {
            return e;
        } finally {

            System.out.println(principal);
        }
    }

}
