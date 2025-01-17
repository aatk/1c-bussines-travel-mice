﻿
Процедура ПриЗаписи(Отказ)
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Начало");
	//
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)	
	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Начало");
	//	
	// регистр АвтозаполнениеЭкстраПолей
	Движения.АвтозаполнениеЭкстраПолейХранение.Записывать = Истина;
	Для Каждого ТекСтрокаЗаполнение Из Заполнение Цикл
		Движение = Движения.АвтозаполнениеЭкстраПолейХранение.Добавить();
		Движение.Партнер = Партнер;
		Движение.Контрагент = Контрагент;
		Движение.Договор = Договор;
		Движение.ЭкстраПоле = ТекСтрокаЗаполнение.ЭкстраПоле;
		Движение.Отбор = ТекСтрокаЗаполнение.УсловиеОтбора;
		Движение.ЗначениеПроверки = ТекСтрокаЗаполнение.ЗначениеПроверки;
		Движение.ЗначениеУстановки = ТекСтрокаЗаполнение.УстанавлваемоеЗначение;
	КонецЦикла;
	
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
