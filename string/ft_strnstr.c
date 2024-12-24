/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mzwart <mzwart@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/15 19:24:41 by mzwart            #+#    #+#             */
/*   Updated: 2023/11/30 18:28:58 by mzwart           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/string.h"

/*
 @needle: null terminated string
 @hay: string
 @len: length of the hay that is being searched for

 function returns:
	- hay if length of needle is 0
	- first occurence of the needle in hay if needle is found
	- NULL if the needle is not found
*/

// TODO: make with real strnstr
char	*ft_strnstr(const char *hay, const char *needle, size_t search_len)
{
	const size_t	needle_len = ft_strlen(needle);

	while (needle_len <= search_len--)
	{
		if (ft_strncmp(hay, needle, needle_len) == 0)
			return ((char *)hay);
		else
			++hay;
	}
	return (NULL);
}

// #include <stdio.h>
//
//  int main()
//  {
// 	char hay[30] = "aabc";
// 	char needle[10] = "b";
//  	char *ptr;
// 	int len = 3;
//  	//ptr = strnstr(hay, needle, len);
//  	//printf("real:%s\n", ptr);
//  	ptr = ft_strnstr(hay, needle, len);
//  	printf("mine:%s", ptr);
//  	return 0;
//  }
