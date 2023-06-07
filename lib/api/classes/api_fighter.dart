class ApiFighter {
  String index;
  String name;
  int hitDie;
  List<ProficiencyChoice> proficiencyChoices;
  List<Proficiency> proficiencies;
  List<Proficiency> savingThrows;
  List<dynamic> startingEquipment;
  List<StartingEquipmentOption> startingEquipmentOptions;
  String classLevels;
  MultiClassing multiClassing;
  List<Proficiency> subclasses;
  String url;

  ApiFighter({
    required this.index,
    required this.name,
    required this.hitDie,
    required this.proficiencyChoices,
    required this.proficiencies,
    required this.savingThrows,
    required this.startingEquipment,
    required this.startingEquipmentOptions,
    required this.classLevels,
    required this.multiClassing,
    required this.subclasses,
    required this.url,
  });

}

class MultiClassing {
  PrerequisiteOptions prerequisiteOptions;
  List<Proficiency> proficiencies;

  MultiClassing({
    required this.prerequisiteOptions,
    required this.proficiencies,
  });

}

class PrerequisiteOptions {
  String type;
  int choose;
  PrerequisiteOptionsFrom from;

  PrerequisiteOptions({
    required this.type,
    required this.choose,
    required this.from,
  });

}

class PrerequisiteOptionsFrom {
  String optionSetType;
  List<PurpleOption> options;

  PrerequisiteOptionsFrom({
    required this.optionSetType,
    required this.options,
  });

}

class PurpleOption {
  String optionType;
  Proficiency abilityScore;
  int minimumScore;

  PurpleOption({
    required this.optionType,
    required this.abilityScore,
    required this.minimumScore,
  });

}

class Proficiency {
  String index;
  String name;
  String url;

  Proficiency({
    required this.index,
    required this.name,
    required this.url,
  });

}

class ProficiencyChoice {
  String desc;
  int choose;
  String type;
  ProficiencyChoiceFrom from;

  ProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class ProficiencyChoiceFrom {
  String optionSetType;
  List<FluffyOption> options;

  ProficiencyChoiceFrom({
    required this.optionSetType,
    required this.options,
  });

}

class FluffyOption {
  String optionType;
  Proficiency item;

  FluffyOption({
    required this.optionType,
    required this.item,
  });

}

class StartingEquipmentOption {
  String desc;
  int choose;
  String type;
  StartingEquipmentOptionFrom from;

  StartingEquipmentOption({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class StartingEquipmentOptionFrom {
  String optionSetType;
  List<ItemElement> options;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    required this.options,
  });

}

class ItemElement {
  OptionType optionType;
  int? count;
  Proficiency? of;
  List<ItemElement>? items;
  Choice? choice;

  ItemElement({
    required this.optionType,
    this.count,
    this.of,
    this.items,
    this.choice,
  });

}

class Choice {
  String desc;
  int choose;
  String type;
  ChoiceFrom from;

  Choice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class ChoiceFrom {
  String optionSetType;
  Proficiency equipmentCategory;

  ChoiceFrom({
    required this.optionSetType,
    required this.equipmentCategory,
  });

}

enum OptionType { COUNTED_REFERENCE, MULTIPLE, CHOICE }
