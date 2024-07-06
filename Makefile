# ------------------------------------ COLORS -------------------------------------
RED := $(shell tput -T xterm setaf 1)
GREEN := $(shell tput -T xterm setaf 2)
YELLOW := $(shell tput -T xterm setaf 3)
BLUE := $(shell tput -T xterm setaf 4)
PURPLE := $(shell tput -T xterm setaf 5)
WHITE := $(shell tput -T xterm setaf 15)
RESET := $(shell tput -T xterm setaf sgr0)
# ---------------------------------------------------------------------------------

BOOL_SRC = \
    ft_isalnum.c \
    ft_isalpha.c \
    ft_isdigit.c \
    ft_isprint.c \
    ft_isascii.c
BOOL_OBJ = $(BOOL_SRC:%.c=$(BUILD_DIR)/%.o)

STR_SRC = \
    ft_strlen.c \
    ft_memchr.c \
    ft_memmove.c \
    ft_memcpy.c \
    ft_memset.c \
    ft_memcmp.c \
    ft_bzero.c \
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
    ft_putnbr_fd.c \
    ft_putnbr_base.c
    
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
    
# adding printf to src files and include dir

# in the future create a seperate folder for seperate parts that
# are consistenly structured so you can do recursive make?


#VPATH = %.c $(MAKECMDGOALS)
PRINTF_SRC := \
    char_specifiers.c \
    int_specifiers.c \
    ft_printf.c \

#    ../ft_memcpy.c \
#    ../ft_memset.c \
#    ../ft_strlen.c \

PRINTF_SRC := $(addprefix ft_printf/, $(PRINTF_SRC))
PRINTF_OBJ = $(PRINTF_SRC:%.c=$(BUILD_DIR)/%.o)

# --- ADD A BUILD DIRECTORY
#NEW_DIR_PATH = build
#PRINTF_OBJ = $(patsubst %.c, $(BUILD_DIR)/%.o, $(PRINTF_SRC))


BUILD_DIR := obj

# ---- INCLUDE DIRECTORY
INC_DIR = include
HEADER_FILES = ft_printf.h libft.h

#HEADERS = $(addprefix $(INCLUDE_DIR)/, $(HEADER_FILES))
OBJ := $(SRC:%.c=$(BUILD_DIR)/%.o)
LST_OBJ := $(BONUS_SRC:%.c=$(BUILD_DIR)/%.o)

# -------------------------------------------------------------------------

# [c] do not warn about library creation
# [r] eplace existing or insert new file(s) into the archive
# [U] set time stamps needed for replacement
ARFLAGS = rcU
NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror

#$(NAME):
	#$(AR) $(ARFLAGS) $@ $?
#all: $(OBJ) $(NAME)($(OBJ))

all: printf

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

printf: $(PRINTF_OBJ) $(NAME)($(PRINTF_OBJ))

bool: $(BOOL_OBJ) $(NAME)

re: fclean all

clean:
	rm -rf $(BUILD_DIR)

fclean: clean
	rm -f $(NAME)

.PHONY:	clean fclean re all lst printf
