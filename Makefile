CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall
SRC = main.cpp
OUT = .out/main

.PHONY: run
run: build
	@./$(OUT)

.PHONY: build
build: $(SRC)
	@$(CXX) $(CXXFLAGS) -o $(OUT) $(SRC)

.PHONY: setup
setup:
	@read -p "Move main.cpp to .backup.cpp and reset from template? (y/N): " confirm; \
	if [ "$$confirm" = "y" ] || [ "$$confirm" = "Y" ]; then \
		mv main.cpp .backup.cpp 2>/dev/null || true; \
		cp tpl/default.cpp main.cpp; \
		echo "Done: main.cpp has been reset."; \
	else \
		echo "Cancelled."; \
	fi

.PHONY: clean
clean:
	@rm -f $(OUT)
