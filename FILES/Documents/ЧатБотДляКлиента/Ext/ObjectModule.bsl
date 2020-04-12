﻿
Процедура ПриЗаписи(Отказ)
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Начало");
	//
	МодульОбъектаСервер.ПриЗаписи(ЭтотОбъект, Отказ, "Конец");
КонецПроцедуры

//Процедура ОбработкаПроведения(Отказ, РежимПроведения)	
//КонецПроцедуры

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

Процедура ОбработкаПроведения(Отказ, РежимПроведения)

	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Начало");
	
		// регистр ДоступныеЧатБоты
		Движения.ДоступныеЧатБоты.Записывать = Истина;
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("Ссылка", ЭтотОбъект.Ссылка);
		Запрос.Текст = "ВЫБРАТЬ
		               |	ЧатБотДляКлиентаДоступныеЧаты.Ссылка КАК Регистратор,
		               |	ЧатБотДляКлиентаДоступныеЧаты.Система КАК СистемаЧатБота,
		               |	ЧатБотДляКлиентаДоступныеЧаты.Ссылка.Партнер КАК Партнер,
		               |	ЧатБотДляКлиентаДоступныеЧаты.Ссылка.Контрагент КАК Контрагент,
		               |	ЧатБотДляКлиентаПользователиОБТ.ПользовательОБТ КАК ПользовательОБТ
		               |ИЗ
		               |	Документ.ЧатБотДляКлиента.ДоступныеЧаты КАК ЧатБотДляКлиентаДоступныеЧаты
		               |		ЛЕВОЕ СОЕДИНЕНИЕ Документ.ЧатБотДляКлиента.ПользователиОБТ КАК ЧатБотДляКлиентаПользователиОБТ
		               |		ПО ЧатБотДляКлиентаДоступныеЧаты.Ссылка = ЧатБотДляКлиентаПользователиОБТ.Ссылка
		               |ГДЕ
		               |	ЧатБотДляКлиентаДоступныеЧаты.Ссылка = &Ссылка";
		Выборка = Запрос.Выполнить().Выбрать();
		Пока  Выборка.Следующий() Цикл
			Движение = Движения.ДоступныеЧатБоты.Добавить();
			ЗаполнитьЗначенияСвойств(Движение, Выборка); 
			Дерево = ЧатБотБТСервер.СформироватьДеревоВопросовПоДокументу(ЭтотОбъект.Ссылка);
			ТекстJSON = УправлениеБТВызовСервера.ВJSON(Дерево);
			Движение.ТекстЧата = ТекстJSON;
		КонецЦикла;

	МодульОбъектаСервер.ОбработкаПроведения(ЭтотОбъект, Отказ, РежимПроведения, "Конец");
	
КонецПроцедуры
