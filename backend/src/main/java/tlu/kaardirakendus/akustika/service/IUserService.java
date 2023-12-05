package tlu.kaardirakendus.akustika.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;

public interface IUserService {

    Object validateUser(OAuth2AuthenticationToken token, HttpServletRequest request, HttpServletResponse response);

}
