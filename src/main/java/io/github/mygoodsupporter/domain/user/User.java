package io.github.mygoodsupporter.domain.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;


@NoArgsConstructor
@Getter @Setter
@Accessors(chain = true)
public class User {

	private Long id;
	private String username;
	private String password;
	private String email;
	private String name;
	private String phone;

	private List<Authority> authorities = new ArrayList<>();
	private int enabled;

}