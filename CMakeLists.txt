CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

INCLUDE(CMakeModules/UseLATEX.cmake)

SET(LATEX_COMPILER xelatex)
SET(PDFLATEX_COMPILER xelatex)

SET(CHILD_DOCUMENTS
    "ВВ/Відпустка.tex"
    "Вій/Колискова.tex"
    "Володимир_Івасюк/Червона_рута.tex"
    "Ляпис_Трубецкой/Воины_света.tex"
    "Ляпис_Трубецкой/Грай.tex"
    "Ляпис_Трубецкой/Не_быць_скотом.tex"
    "Мандри/Дорога.tex"
    "Мандри/Не_спи_моя_рідна_земля.tex"
    "Мандри/Орися.tex"
    "Народні/Червоненький_бурячок.tex"
    "Народні/Чорна_гора.tex"
    "Обійми_дощу/Земле_моя_мила.tex"
    "Олексій_Бик/Маленький_чорний_котик.tex"
    "Піккардійська_терція/Плине_кача.tex"
    "Стары_Ольса/У_карчме.tex"
    "Тартак/Лицарський_хрест.tex"
    "Тінь_Сонця/Козача_могила.tex"
)

#TODO: Make dependencies transparent, avoid globbing
FILE(GLOB_RECURSE LILYPOND_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.ly")
FILE(GLOB_RECURSE LYTEX_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.lytex")

SET(LILYPOND_TEX_FILES)
FOREACH(LYTEX_FILE ${LYTEX_FILES})
    STRING(REPLACE ".lytex" ".tex" LILYPOND_TEX_FILE ${LYTEX_FILE})
    LIST(APPEND LILYPOND_TEX_FILES ${LILYPOND_TEX_FILE})
    GET_FILENAME_COMPONENT(LILYPOND_TEX_OUT_DIR ${LILYPOND_TEX_FILE} DIRECTORY)
    #TODO: add relevant lilypond files as dependencies based on filename
    ADD_CUSTOM_COMMAND(
        OUTPUT ${LILYPOND_TEX_FILE}
        COMMAND lilypond-book --latex-program=xelatex -f latex --out ${LILYPOND_TEX_OUT_DIR} ${LYTEX_FILE}
        DEPENDS ${LYTEX_FILE} 
    )
ENDFOREACH()

message("LILYPOND_TEX_FILES: " ${LILYPOND_TEX_FILES})

ADD_LATEX_DOCUMENT(songbook.tex 
    INPUTS ${CHILD_DOCUMENTS} ${LILYPOND_FILES} ${LYTEX_FILES}
    DEPENDS ${LILYPOND_TEX_FILES}
    DEFAULT_PDF)
