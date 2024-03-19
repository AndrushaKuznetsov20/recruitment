package com.example.recruitment.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN, ROLE_DIRECTOR, ROLE_RECRUTER, ROLE_DEPARTMENTHEAD, ROLE_APPLICANT;

    @Override
    public String getAuthority() {
        return name();
    }
}
