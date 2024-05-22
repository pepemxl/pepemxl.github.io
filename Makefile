PY := python3.10
VENV := venv
REPONAME=$(basename $(pwd))

.PHONY: help
help:
	@echo 
	@echo "- \make install"

${VENV}:
	@echo "Create venv"
	${PY} -m venv ./${VENV}
	@echo "Update pip"
	./${VENV}/bin/python3 -m pip install --upgrade pip

.PHONY: install
install: $(VENV)
	@echo "Installed project in virtual environment..."
	@echo "Linux: Use \"source venv/bin/activate\""
#	@echo "Linux: Run \"poetry install\""
	@echo ${REPONAME}


.PHONY: clean
clean: ${VENV}
	rm -rf dist
	rm -rf ${VENV}
	rm -rf poetry.lock
#	find . -type f -name *.pyc -delete
#	find . -type d -name __pycache__ -delete

