SRC_FILES = \
ft_isalnum.c \
ft_isalpha.c \
ft_isdigit.c \
ft_isprint.c \
ft_strlen.c \
ft_memchr.c \
ft_memmove.c \
ft_memcpy.c \
ft_memset.c \
ft_memcmp.c \
ft_bzero.c \
ft_isascii.c \
ft_strrchr.c \
ft_strchr.c \
ft_strlcat.c \
ft_strlcpy.c \
ft_strncmp.c \
ft_strnstr.c \
ft_tolower.c \
ft_toupper.c \
ft_strdup.c \
ft_calloc.c \
ft_atoi.c \
ft_substr.c \
ft_strjoin.c \
ft_strtrim.c \
ft_split.c \
ft_itoa.c \
ft_strmapi.c \
ft_striteri.c \
ft_putchar_fd.c \
ft_putstr_fd.c \
ft_putendl_fd.c \
ft_putnbr_fd.c

SRC_DIR = src
OBJ_DIR = obj
INC_DIR = include
BIN_DIR = bin

SOURCES := $($(SRC_DIR)/$(SRC_FILES))
INCLUDE := $($(INC_DIR)/$(HEADER_FILES))

BONUS_SRC = \
ft_lstnew.c \
ft_lstadd_front.c \
ft_lstlast.c \
ft_lstsize.c \
ft_lstadd_back.c \
ft_lstdelone.c \
ft_lstclear.c \
ft_lstiter.c \
ft_lstmap.c

CC = cc
CFLAGS = -Wall -Wextra -Werror
ARFLAGS = crU

HEADER_FILES = libft.h
NAME = libft.a
OBJ = $(SOURCES:.c=.o)
BONUS_OBJ = $(BONUS_SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	rm -f $(OBJ) $(BONUS_OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

bonus: $(BONUS_OBJ) $(NAME) $(NAME)($(BONUS_OBJ))

.PHONY:	clean fclean re all bonus
