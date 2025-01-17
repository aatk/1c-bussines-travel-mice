﻿
Процедура ПриЗаписи(Отказ)
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Начало");
	//
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)	
	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Начало");
	//	
	Если НЕ МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Вместо") Тогда
		УправлениеБТСервер.ЗаписатьGUID(Ссылка);
		
		
		Движения.УслугиВЗаказеПоставщика.Записывать = Истина;
		Движения.УслугиВЗаказеПоставщика.Очистить();	
		Для Каждого СтрокаСТоваром ИЗ ЭтотОбъект.Товары Цикл
			Движение = Движения.УслугиВЗаказеПоставщика.Добавить();
			Движение.Услуга = СтрокаСТоваром.Услуга;
			Движение.ЗаказПоставщикуБТ = Ссылка;
		КонецЦикла;

		Движения.ОписаниеУслугВЗаказахПоставщикаБТ.Записывать = Истина;
		Движения.ОписаниеУслугВЗаказахПоставщикаБТ.Очистить();
		Для Каждого СтрокаСОписанием ИЗ ЭтотОбъект.ОписаниеУслуг Цикл
			Движение = Движения.ОписаниеУслугВЗаказахПоставщикаБТ.Добавить();
			Движение.ЗаказПоставщикуБТ = Ссылка;
			Движение.Характеристика = СтрокаСОписанием.Характеристика;
			Движение.Значение = СтрокаСОписанием.Значение;
		КонецЦикла;
		
		// регистр БалансПоПоставщикам Расход
		Движения.БалансПоПоставщикам.Очистить();
		Движения.БалансПоПоставщикам.Записывать = Истина;
		Для Каждого ТекСтрокаПоУслугам Из Товары Цикл
			Движение = Движения.БалансПоПоставщикам.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
			Движение.Период = Дата;
			Движение.Организация = Организация;
			Движение.Партнер = Партнер;
			Движение.Контрагент = Контрагент;
			Движение.Договор = Договор;
			Движение.Услуга = ТекСтрокаПоУслугам.Услуга;
			Движение.Сумма = ТекСтрокаПоУслугам.СуммаСНДС;
		КонецЦикла;
		
		
	КонецЕсли;
	
	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Конец");
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Начало");
	//
	МодульОбъектаСервер.ОбработкаЗаполнения(ЭтотОбъект, ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка, "Конец");
КонецПроцедуры

Процедура ОбработкаУдаленияПроведения(Отказ)
	МодульОбъектаСервер.ОбработкаУдаленияПроведения(ЭтотОбъект, Отказ, "Начало");
	//	
	МодульОбъектаСервер.ОбработкаУдаленияПроведения(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ, "Начало");
	//	
	МодульОбъектаСервер.ПередУдалением(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Начало");
	//	
	МодульОбъектаСервер.ПередЗаписью(ЭтотОбъект, Отказ, РежимЗаписи, РежимПроведения, "Конец");
КонецПроцедуры

Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс)
	МодульОбъектаСервер.ПриУстановкеНовогоНомера(ЭтотОбъект, СтандартнаяОбработка, Префикс, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ПриУстановкеНовогоНомера(ЭтотОбъект, СтандартнаяОбработка, Префикс, "Конец");
КонецПроцедуры

Процедура ПриКопировании(ОбъектКопирования)
	МодульОбъектаСервер.ПриКопировании(ЭтотОбъект, ОбъектКопирования, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ПриКопировании(ЭтотОбъект, ОбъектКопирования, "Конец");
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	МодульОбъектаСервер.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты, "Начало");
	// Вставить содержимое обработчика.
	МодульОбъектаСервер.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты, "Конец");
КонецПроцедуры
