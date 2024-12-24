/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strncmp.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mzwart <mzwart@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/15 21:15:51 by mzwart            #+#    #+#             */
/*   Updated: 2023/11/30 15:26:43 by mzwart           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/string.h"

int	ft_strncmp(const char *s1, const char *s2, size_t n)
{
	size_t	i;

	i = 0;
	while ((s1[i] || s2[i]) && i < n)
	{
		if (s1[i] != s2[i])
			return ((unsigned char)s1[i] - (unsigned char)s2[i]);
		else
			++i;
	}
	return (0);
}

// #include <string.h>
// #include <stdio.h>
// int	main(int argc, char *argv[])
// {
// 	char *str = "abcd";
// 	char *str2 = "abcdxyz";
// 	int size;
// 	size = strlen(str) + 1;
// 	printf("mine:%d\n", ft_strncmp(str, str2, size));
// 	printf("real:%d\n", strncmp(str, str2, size));
// 	return 0;
// }
