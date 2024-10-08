# --------------------------------- COLORS --------------------------------------
RED := $(shell tput -T xterm setaf 1)
GREEN := $(shell tput -T xterm setaf 2)
YELLOW := $(shell tput -T xterm setaf 3)
BLUE := $(shell tput -T xterm setaf 4)
PURPLE := $(shell tput -T xterm setaf 5)
CYAN := $(shell tput -T xterm setaf 6)
WHITE := $(shell tput -T xterm setaf 7)
RESET := $(shell tput -T xterm setaf 7)
# TODO:NO WORKY
#RESET := $(shell tput -T xterm setaf sgr0)

# ------------------------------ configurable -----------------------------------
# -MMD generates makefile dependencies that tell make which source file depend
#  on what headers. These get generated at the same time when the source files are compiled
DEP_FLAGS = -MMD -MP
CFLAGS = -Wall -Wextra -Werror
CC = cc
INCLUDE_PATHS = ./include

# (not used by gcc)
BUILD_DIR = ./build

# [c] do not warn about creation of file
# [r] eplace existing or insert new file(s) into the archive
# [U] set time stamps needed for replacement using make's archive(member) function
ARFLAGS = rcU
NAME = libft.a

LIBFT_MODULES ?= bool string stdio stdlib
# use 'export' in other makefile to set this. or use flag: -e SUB_MODULES="list of sub modules here ..."
# This can be used to change the module make will compile when recursively calling this Makefile.

# ---------------------------------- Files --------------------------------------

# ft_bool.h
BOOL_SRC := \
    ft_isdecimal.c \
    ft_isalnum.c \
    ft_isalpha.c \
    ft_isdigit.c \
    ft_isprint.c \
    ft_isascii.c \
    ft_is_int.c \

# ft_ctype.h
CTYPE_SRC := \
    ft_tolower.c \
    ft_toupper.c \

STRING_SRC = \
    ft_strlen.c \
    ft_strrchr.c \
    ft_strchr.c \
    ft_strlcat.c \
    ft_strlcpy.c \
    ft_strncmp.c \
    ft_strnstr.c \
    ft_strdup.c \
    ft_substr.c \
    ft_strjoin.c \
    ft_strtrim.c \
    ft_striteri.c \
    ft_strmapi.c \
    ft_memset.c \
    ft_memcpy.c \
    ft_memcmp.c \
    ft_memmove.c \
    ft_memchr.c \

STDLIB_SRC = \
    ft_atoi.c \
    ft_itoa.c \
    ft_calloc.c \
    ft_atof.c \

MORE_STUFF = \
    ft_split.c \

STR_SRC = \
    ft_bzero.c \
    ft_putchar_fd.c \
    ft_putstr_fd.c \
    ft_putendl_fd.c \
    ft_putnbr_fd.c \
    ft_putnbr_base.c

LST_SRC := \
    ft_lstnew.c \
    ft_lstadd_front.c \
    ft_lstlast.c \
    ft_lstsize.c \
    ft_lstadd_back.c \
    ft_lstdelone.c \
    ft_lstclear.c \
    ft_lstiter.c \
    ft_lstmap.c \

PRINTF_SRC  := \
    char_specifiers.c \
    int_specifiers.c \
    ft_printf.c \

# If source files are in sub directories (ft_printf directory in this case):
PRINTF_SRC := $(addprefix ft_printf/, $(PRINTF_SRC))
# this line is using the variables of the previous variable initialization
# so it has to be bellow the SRC files

STDIO_SRC := \
    ft_putnbr_base.c \
    ft_putstr_fd.c \
    ft_putnbr_fd.c \
    ft_putendl_fd.c \

# MINIMAL_SRC = \
#     ft_strlen.c \

# -------------------------------------------------------------------------
INCLUDE_FLAGS = $(addprefix -I, $(INCLUDE_PATHS))
CFLAGS += $(INCLUDE_FLAGS)

# NOTE: on error delete the archive file ?

# NOTE: put into single file?

# This needs to be at the end of all variables suffixed with _SRC.
# Turns all variables suffixed with _SRC variables into variables suffixed with _OBJ,
# and substitutes %.c for %.o files, prefixed by the build directory.
ALL_SRC_VARS := $(filter %_SRC, $(.VARIABLES))
$(foreach var, $(ALL_SRC_VARS), $(eval $(patsubst %_SRC, %_OBJ, $(var)) := $($(var):%.c=$(BUILD_DIR)/%.o)))

# Formatting without ALL_SRC_VARS (is more work two add new src files,
# but is not creating ambiguous variables).
# SRC_DIR_CTYPE = .
# CTYPE_OBJ := $(patsubst %.c, $(BUILD_DIR)/$(SRC_DIR_CTYPE)/%.o, \
#     ft_isalnum.c \
#     ft_isalpha.c \
#     ft_isdigit.c \
#     ft_isprint.c \
#     ft_isascii.c \
# )

# This does NOT create, but lists the names of the dependency files which 'Make' uses to know
# when an obj dpending on a header needs to be rebuild, when that header file has changed.
ALL_OBJ_VARS := $(filter %_OBJ, $(.VARIABLES))

ALL_DEPS := $(patsubst %.o, %.d, $(foreach var, $(ALL_OBJ_VARS), $($(var))))
# -------------------------------------------------------------------------

all: $(LIBFT_MODULES)

$(NAME):
	$(AR) $(ARFLAGS) $(NAME)

$(BUILD_DIR)/%.o: %.c
	@echo -n $(GREEN)
	@mkdir -p $(dir $@)
	$(CC) $(DEP_FLAGS) $(CFLAGS) -c $< -o $@
	@echo -n $(CYAN)

# Alias for ctype library :)
bool: $(BOOL_OBJ) $(NAME)($(BOOL_OBJ))

ctype: bool $(CTYPE_OBJ) $(NAME)($(CTYPE_OBJ))

string: $(STRING_OBJ) $(NAME)($(STRING_OBJ))

printf: string ctype $(PRINTF_OBJ) $(NAME)($(PRINTF_OBJ))

stdio: printf $(STDIO_OBJ) $(NAME)($(STDIO_OBJ))

# TODO: add more subdivisions to stdlib

stdlib: bool $(STDLIB_OBJ) $(NAME)($(STDLIB_OBJ))

lst: $(LST_OBJ) $(NAME)($(LST_OBJ))


clean:
	@echo -n $(RED)
	rm -rf $(BUILD_DIR)
	@echo -n $(RESET)

fclean: clean
	@echo -n $(RED)
	rm -f $(NAME)
	@echo -n $(RESET)


re: fclean all

-include $(ALL_DEPS)

.PHONY:	clean fclean re all $(ALL_MODULES)

.NOTPARALLEL: all
