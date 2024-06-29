

int main()
{
	char c = b
	int idx = 0;
	while (idx < CHAR_BITS)
	{
		if (c & (1 << idx))
			kill(server_pid, SIGUSR1);
		else
			kill(server_pid, SIGUSR2);
		usleep(delay);
		idx++;
	}
	printf(" = %c\n", c);

}
