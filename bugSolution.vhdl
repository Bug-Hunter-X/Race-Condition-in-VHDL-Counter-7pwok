```vhdl
ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        count : OUT INTEGER RANGE 0 TO 15
    );
END ENTITY;

ARCHITECTURE behavioral OF counter IS
    SIGNAL internal_count : INTEGER RANGE 0 TO 15 := 0;
    SIGNAL sync_enable : STD_LOGIC := '0';
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            internal_count <= 0;
            sync_enable <= '0';
        ELSIF rising_edge(clk) THEN
            sync_enable <= enable;
            IF sync_enable = '1' THEN
                internal_count <= internal_count + 1;
            END IF;
        END IF;
    END PROCESS;
    count <= internal_count;
END ARCHITECTURE;
```