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

ADD_LATEX_DOCUMENT(songbook.tex 
    INPUTS ${CHILD_DOCUMENTS}
    DEPENDS ${GENERATED_DOCUMENTS}
    DEFAULT_PDF)
