VERSION=1.1
ARCHIVE=git-tools-$(VERSION).tar.gz

all:

release:
	git tag v$(VERSION)
	git push --tags
	git archive --format=tar --prefix=git-tools-$(VERSION)/ HEAD | gzip >$(ARCHIVE)
	scp $(ARCHIVE) atrey:~ftp/pub/local/mj/linux/
	ssh jw "cd www && bin/release-prog git-tools $(VERSION)"
	mv $(ARCHIVE) ~/archives/mj/
