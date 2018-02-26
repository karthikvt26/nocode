REMOTEVAL?=origin

.PHONY: deploy-and-clear
deploy-and-clear: deploy clear-cache

.PHONY: deploy
deploy:
	@echo "Pushing to the configured remote"
	@git push $(REMOTEVAL) master

.PHONY: clear-cache
clear-cache:
	@./clear-cache.sh ${ZONE_ID} ${AUTH_EMAIL} ${AUTH_KEY}
