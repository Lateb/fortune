SRCS = lateb
DATS = lateb.dat

FORTUNEDIR = usr/share/games/fortune

CLEANFILES += ${DATS} ${SRCS}

all: ${DATS}

install: ${SRCS} ${DATS}
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m 444 \
		${SRCS} ${DESTDIR}/${FORTUNEDIR}
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m 444 \
		${DATS} ${DESTDIR}/${FORTUNEDIR}

lateb.dat: lateb
	@strfile -rsx ${.ALLSRC} ${.TARGET}

lateb: lateb.real
	@tr [a-zA-Z] [n-za-mN-ZA-M] < ${.ALLSRC} > ${.TARGET}

.include <bsd.prog.mk>
