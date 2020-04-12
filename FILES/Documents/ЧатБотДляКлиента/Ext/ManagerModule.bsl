﻿
#Область Отчеты

// Заполняет список команд отчетов.
// 
// Параметры:
//   КомандыОтчетов - ТаблицаЗначений - состав полей см. в функции МенюОтчеты.СоздатьКоллекциюКомандОтчетов
//
Процедура ДобавитьКомандыОтчетов(КомандыОтчетов, Параметры = Неопределено) Экспорт
	
	МодульМенеджераОбъектыСервер.ДобавитьКомандыОтчетов("ЧатБотДляКлиента", КомандыОтчетов);
		
КонецПроцедуры

// Заполняет список команд печати.
// 
// Параметры:
//   КомандыПечати - ТаблицаЗначений - состав полей см. в функции УправлениеПечатью.СоздатьКоллекциюКомандПечати
//
Процедура ДобавитьКомандыПечати(КомандыПечати, Параметры = Неопределено) Экспорт
	//	
	МодульМенеджераОбъектыСервер.ДобавитьКомандыПечати("ЧатБотДляКлиента", КомандыПечати);
	
КонецПроцедуры

// Заполняет список команд создания на основании.
// 
// Параметры:
//   КомандыСоздатьНаОсновании - ТаблицаЗначений - состав полей см. в функции ВводНаОсновании.СоздатьКоллекциюКомандСоздатьНаОсновании
//
Процедура ДобавитьКомандыСозданияНаОсновании(КомандыСоздатьНаОсновании, Параметры = Неопределено) Экспорт	
	//
	МодульМенеджераОбъектыСервер.ДобавитьКомандыСозданияНаОсновании("ЧатБотДляКлиента", КомандыСоздатьНаОсновании);
	
КонецПроцедуры

#КонецОбласти 


Процедура ОбработкаПолученияФормы(ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.ЧатБотДляКлиента";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияФормы(ТипМодуля, ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияФормы(ТипМодуля, ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияДанныхВыбора(ДанныеВыбора, Параметры, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.ЧатБотДляКлиента";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияДанныхВыбора(ТипМодуля, ДанныеВыбора, Параметры, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияДанныхВыбора(ТипМодуля, ДанныеВыбора, Параметры, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.ЧатБотДляКлиента";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПолейПредставления(ТипМодуля, Поля, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПолейПредставления(ТипМодуля, Поля, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.ЧатБотДляКлиента";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПредставления(ТипМодуля, Данные, Представление, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПредставления(ТипМодуля, Данные, Представление, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры
