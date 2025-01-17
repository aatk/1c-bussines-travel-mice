﻿
&НаКлиенте
Процедура Команда1(Команда)
	ОбновитьИдентификаторы();
КонецПроцедуры


// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура ОбновитьИдентификаторы()

	Справочники.ИдентификаторыОбъектовМетаданных.ОбновитьДанныеСправочника(Истина,Ложь,Ложь);


КонецПроцедуры // ()

&НаСервере
Процедура ОбновитьВариантыОтчетовНаСервере()	
	
	ПараметрыОтчетов = Новый Структура;
    ПараметрыОтчетов.Вставить("МонопольныйРежим", Истина);
    //ПараметрыОтчетов.Вставить("РазделенныеОбработчики", ОбновлениеИнформационнойБазы.НоваяТаблицаОбработчиковОбновления());
	//ВариантыОтчетов.Обновить(ПараметрыОтчетов);

	//ПараметрыОтчетов = Новый Структура;
	//ПараметрыОтчетов.Вставить("МонопольныйРежим", Истина);
	//ВариантыОтчетов.ОбновитьРазделенныеДанные(ПараметрыОтчетов);
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьВариантыОтчетов(Команда)
	ОбновитьВариантыОтчетовНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОбновитьРолиНаСервере()
	Константы.ПараметрыРаботыПользователей.СоздатьМенеджерЗначения().ОбновитьОбщиеПараметры();
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьРоли(Команда)
	ОбновитьРолиНаСервере();
КонецПроцедуры
