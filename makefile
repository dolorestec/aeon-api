###
# Makefile
# Instalção do ambiente de Desenvolvimento,
# ferramentas de qualidade de código e testes.
###

### Colors:
# Reset
RESET='\033[0m'
# Regular Colors
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
WARNING='\033[0;33m'
BOLD = '\033[1m'

commit:
	@echo -e ${BOLD}Commit changes${RESET};
	@git add .
	@git commit -m "[MAKEFILE] - Commit changes.";
	@git push origin

lint:
	@echo -e ${BOLD}Running ruff ${RESET};
	@ruff check --fix src
	@ruff format src

pytest:
	@echo -e ${BOLD}Start testing with pytest...${RESET};
	@poetry run pytest

check:
	@poetry check --no-cache

build:
	@poetry build --no-cache

publish:
	@echo -e ${BOLD}Start publish...${RESET};

sonar:
	@docker run \
			--network=sonarqube \
			-e SONAR_HOST_URL="${ALM_CLI_SONAR_HOST_URL}"  \
			-v ".:/usr/src" \
			sonarsource/sonar-scanner-cli\
				-Dsonar.projectKey="${ALM_CLI_SONAR_PROJECT_KEY}" \
				-Dsonar.sonar.projectName="${ALM_CLI_SONAR_PROJECT_KEY}" \
				-Dsonar.sonar.sourceEncoding=UTF-8 \
				-Dsonar.python.version=3.12 \
				-Dsonar.sonar.host.url="${ALM_CLI_SONAR_HOST_URL}" \
				-Dsonar.token="${ALM_CLI_SONAR_TOKEN_USER}"

coverage:
	@echo -e ${BOLD}Start testing with pytest...${RESET};
	@poetry run pytest -v --cov=cli --cov-report=html ./test

install:
	@echo -e ${BOLD}Install ALM-CLI${RESET};
	@poetry check --no-cache
	@poetry build --no-cache
	@poetry install
	@alm-cli --help
