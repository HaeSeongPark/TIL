
import Foundation
//
//let stringPattern: String  = "[\\s]*\"[^\"]+\"[\\s]*"
//let intPattern: String = "[\\s]*\\d+[\\s]*"
//let boolPattern: String = "[\\s]*(true|false)[\\s]*"
//let dictionaryPattern: String = "\(stringPattern):(\(stringPattern)|\(intPattern)|\(boolPattern))"
//let objectPattern: String = "[\\s]*\\{(\(dictionaryPattern){1}[,]{1})*\(dictionaryPattern)\\}[\\s]*"
//
//
//let input = "{ \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"children\" : [\"hana\", \"hayul\", \"haun\"] }"
//let regex = try! NSRegularExpression(pattern: objectPattern, options: [])
//let mathes = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
//mathes.count
//let replacedInput = regex.stringByReplacingMatches(in: input,
//                                                   options: [],
//                                                   range: NSRange(location: 0, length: input.count),
//                                                   withTemplate: "$0:$1")
//print(replacedInput)
//
let input = "(11,2)-(3,4)-(5,6)"
// { "name" : "KIM JUNG", "alias" : "JK", "level" : 5, "children" : ["hana", "hayul", "haun"] }
let inputSecond = "{ \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"children\" : [\"hana\", \"hayul\", \"haun\"] }"


let pattern = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
let patternSecond = "\\{"
let regex = try! NSRegularExpression(pattern: pattern, options: [])
//let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))


//guard matches.count != 0 else {
//    return
//}

let replacedInput = regex.stringByReplacingMatches(in: input,
                                                   options: [],
                                                   range: NSRange(location: 0, length: input.count),
                                                   withTemplate: "$1,$2")

var separatedInputIntoPoint = replacedInput.split(separator: "-")

let inputk = "[ TRuE , false]"
let patternk = "\\[\\b(true|false)\\b\\]"
let regexk = try! NSRegularExpression(pattern: patternk, options:.caseInsensitive)
let matcheslk = regexk.matches(in: inputk, options: [], range: NSRange(location: 0, length: inputk.count))
matcheslk.count
regexk.enumerateMatches(in: inputk, options: [], range: NSRange(location: 0, length: inputk.count)) { result, flags, stop in
//    print(result?.description)
//    print(flags)
//    print(stop)
}
//matcheslk.count
//for mtachelk in matcheslk {
//    print(mtachelk.)
//}
let replacedInputK = regexk.stringByReplacingMatches(in: inputk, options: [], range: NSRange(location: 0, length: inputk.count), withTemplate: "$1")
//regexk.dictionaryWithValues(forKeys: <#T##[String]#>)







let nameRegex = try! NSRegularExpression(pattern: "([A-Z]\\S+)\\s+([A-Z]\\S+(vitch|vna))")

let bookString = """
The Project Gutenberg EBook of The Brothers Karamazov by Fyodor
Dostoyevsky



This ebook is for the use of anyone anywhere in the United States and most
other parts of the world at no cost and with almost no restrictions
whatsoever. You may copy it, give it away or re‐use it under the terms of
the Project Gutenberg License included with this eBook or online at
http://www.gutenberg.org/license. If you are not located in the United
States, you’ll have to check the laws of the country where you are located
before using this ebook.



Title: The Brothers Karamazov

Author: Fyodor Dostoyevsky

Release Date: February 12, 2009 [Ebook #28054]

Language: English

Character set encoding: UTF‐8


***START OF THE PROJECT GUTENBERG EBOOK THE BROTHERS KARAMAZOV***





The Brothers Karamazov

Translated from the Russian of

Fyodor Dostoyevsky

by Constance Garnett

The Lowell Press

New York





CONTENTS


Part I
Book I. The History Of A Family
Chapter I. Fyodor Pavlovitch Karamazov
Chapter II. He Gets Rid Of His Eldest Son
Chapter III. The Second Marriage And The Second Family
Chapter IV. The Third Son, Alyosha
Chapter V. Elders
Book II. An Unfortunate Gathering
Chapter I. They Arrive At The Monastery
Chapter II. The Old Buffoon
Chapter III. Peasant Women Who Have Faith
Chapter IV. A Lady Of Little Faith
Chapter V. So Be It! So Be It!
Chapter VI. Why Is Such A Man Alive?
Chapter VII. A Young Man Bent On A Career
Chapter VIII. The Scandalous Scene
Book III. The Sensualists
Chapter I. In The Servants’ Quarters
Chapter II. Lizaveta
Chapter III. The Confession Of A Passionate Heart—In Verse
Chapter IV. The Confession Of A Passionate Heart—In Anecdote
Chapter V. The Confession Of A Passionate Heart—"Heels Up"
Chapter VI. Smerdyakov
Chapter VII. The Controversy
Chapter VIII. Over The Brandy
Chapter IX. The Sensualists
Chapter X. Both Together
Chapter XI. Another Reputation Ruined
Part II
Book IV. Lacerations
Chapter I. Father Ferapont
Chapter II. At His Father’s
Chapter III. A Meeting With The Schoolboys
Chapter IV. At The Hohlakovs’
Chapter V. A Laceration In The Drawing‐Room
Chapter VI. A Laceration In The Cottage
Chapter VII. And In The Open Air
Book V. Pro And Contra
Chapter I. The Engagement
Chapter II. Smerdyakov With A Guitar
Chapter III. The Brothers Make Friends
Chapter IV. Rebellion
Chapter V. The Grand Inquisitor
Chapter VI. For Awhile A Very Obscure One
Chapter VII. “It’s Always Worth While Speaking To A Clever Man”
Book VI. The Russian Monk
Chapter I. Father Zossima And His Visitors
Chapter II. The Duel
Chapter III. Conversations And Exhortations Of Father Zossima
Part III
Book VII. Alyosha
Chapter I. The Breath Of Corruption
Chapter II. A Critical Moment
Chapter III. An Onion
Chapter IV. Cana Of Galilee
Book VIII. Mitya
Chapter I. Kuzma Samsonov
Chapter II. Lyagavy
Chapter III. Gold‐Mines
Chapter IV. In The Dark
Chapter V. A Sudden Resolution
Chapter VI. “I Am Coming, Too!”
Chapter VII. The First And Rightful Lover
Chapter VIII. Delirium
Book IX. The Preliminary Investigation
Chapter I. The Beginning Of Perhotin’s Official Career
Chapter II. The Alarm
Chapter III. The Sufferings Of A Soul, The First Ordeal
Chapter IV. The Second Ordeal
Chapter V. The Third Ordeal
Chapter VI. The Prosecutor Catches Mitya
Chapter VII. Mitya’s Great Secret. Received With Hisses
Chapter VIII. The Evidence Of The Witnesses. The Babe
Chapter IX. They Carry Mitya Away
Part IV
Book X. The Boys
Chapter I. Kolya Krassotkin
Chapter II. Children
Chapter III. The Schoolboy
Chapter IV. The Lost Dog
Chapter V. By Ilusha’s Bedside
Chapter VI. Precocity
Chapter VII. Ilusha
Book XI. Ivan
Chapter I. At Grushenka’s
Chapter II. The Injured Foot
Chapter III. A Little Demon
Chapter IV. A Hymn And A Secret
Chapter V. Not You, Not You!
Chapter VI. The First Interview With Smerdyakov
Chapter VII. The Second Visit To Smerdyakov
Chapter VIII. The Third And Last Interview With Smerdyakov
Chapter IX. The Devil. Ivan’s Nightmare
Chapter X. “It Was He Who Said That”
Book XII. A Judicial Error
Chapter I. The Fatal Day
Chapter II. Dangerous Witnesses
Chapter III. The Medical Experts And A Pound Of Nuts
Chapter IV. Fortune Smiles On Mitya
Chapter V. A Sudden Catastrophe
Chapter VI. The Prosecutor’s Speech. Sketches Of Character
Chapter VII. An Historical Survey
Chapter VIII. A Treatise On Smerdyakov
Chapter IX. The Galloping Troika. The End Of The Prosecutor’s
Speech.
Chapter X. The Speech For The Defense. An Argument That Cuts Both
Ways
Chapter XI. There Was No Money. There Was No Robbery
Chapter XII. And There Was No Murder Either
Chapter XIII. A Corrupter Of Thought
Chapter XIV. The Peasants Stand Firm
Epilogue
Chapter I. Plans For Mitya’s Escape
Chapter II. For A Moment The Lie Becomes Truth
Chapter III. Ilusha’s Funeral. The Speech At The Stone
Footnotes






PART I




Book I. The History Of A Family



Chapter I. Fyodor Pavlovitch Karamazov


Alexey Fyodorovitch Karamazov was the third son of Fyodor Pavlovitch
Karamazov, a land owner well known in our district in his own day, and
still remembered among us owing to his gloomy and tragic death, which
happened thirteen years ago, and which I shall describe in its proper
place. For the present I will only say that this “landowner”—for so we
used to call him, although he hardly spent a day of his life on his own
estate—was a strange type, yet one pretty frequently to be met with, a
type abject and vicious and at the same time senseless. But he was one of
those senseless persons who are very well capable of looking after their
worldly affairs, and, apparently, after nothing else. Fyodor Pavlovitch,
for instance, began with next to nothing; his estate was of the smallest;
he ran to dine at other men’s tables, and fastened on them as a toady, yet
at his death it appeared that he had a hundred thousand roubles in hard
cash. At the same time, he was all his life one of the most senseless,
fantastical fellows in the whole district. I repeat, it was not
stupidity—the majority of these fantastical fellows are shrewd and
intelligent enough—but just senselessness, and a peculiar national form of
it.

He was married twice, and had three sons, the eldest, Dmitri, by his first
wife, and two, Ivan and Alexey, by his second. Fyodor Pavlovitch’s first
wife, Adelaïda Ivanovna, belonged to a fairly rich and distinguished noble
family, also landowners in our district, the Miüsovs. How it came to pass
that an heiress, who was also a beauty, and moreover one of those
vigorous, intelligent girls, so common in this generation, but sometimes
also to be found in the last, could have married such a worthless, puny
weakling, as we all called him, I won’t attempt to explain. I knew a young
lady of the last “romantic” generation who after some years of an
enigmatic passion for a gentleman, whom she might quite easily have
married at any moment, invented insuperable obstacles to their union, and
ended by throwing herself one stormy night into a rather deep and rapid
river from a high bank, almost a precipice, and so perished, entirely to
satisfy her own caprice, and to be like Shakespeare’s Ophelia. Indeed, if
this precipice, a chosen and favorite spot of hers, had been less
picturesque, if there had been a prosaic flat bank in its place, most
likely the suicide would never have taken place. This is a fact, and
probably there have been not a few similar instances in the last two or
three generations. Adelaïda Ivanovna Miüsov’s action was similarly, no
doubt, an echo of other people’s ideas, and was due to the irritation
caused by lack of mental freedom. She wanted, perhaps, to show her
feminine independence, to override class distinctions and the despotism of
her family. And a pliable imagination persuaded her, we must suppose, for
a brief moment, that Fyodor Pavlovitch, in spite of his parasitic
position, was one of the bold and ironical spirits of that progressive
epoch, though he was, in fact, an ill‐natured buffoon and nothing more.
What gave the marriage piquancy was that it was preceded by an elopement,
and this greatly captivated Adelaïda Ivanovna’s fancy. Fyodor Pavlovitch’s
position at the time made him specially eager for any such enterprise, for
he was passionately anxious to make a career in one way or another. To
attach himself to a good family and obtain a dowry was an alluring
prospect. As for mutual love it did not exist apparently, either in the
bride or in him, in spite of Adelaïda Ivanovna’s beauty. This was,
perhaps, a unique case of the kind in the life of Fyodor Pavlovitch, who
was always of a voluptuous temper, and ready to run after any petticoat on
the slightest encouragement. She seems to have been the only woman who
made no particular appeal to his senses.

Immediately after the elopement Adelaïda Ivanovna discerned in a flash
that she had no feeling for her husband but contempt. The marriage
accordingly showed itself in its true colors with extraordinary rapidity.
Although the family accepted the event pretty quickly and apportioned the
runaway bride her dowry, the husband and wife began to lead a most
disorderly life, and there were everlasting scenes between them. It was
said that the young wife showed incomparably more generosity and dignity
than Fyodor Pavlovitch, who, as is now known, got hold of all her money up
to twenty‐five thousand roubles as soon as she received it, so that those
thousands were lost to her for ever. The little village and the rather
fine town house which formed part of her dowry he did his utmost for a
long time to transfer to his name, by means of some deed of conveyance. He
would probably have succeeded, merely from her moral fatigue and desire to
get rid of him, and from the contempt and loathing he aroused by his
persistent and shameless importunity. But, fortunately, Adelaïda
Ivanovna’s family intervened and circumvented his greediness. It is known
for a fact that frequent fights took place between the husband and wife,
but rumor had it that Fyodor Pavlovitch did not beat his wife but was
beaten by her, for she was a hot‐tempered, bold, dark‐browed, impatient
woman, possessed of remarkable physical strength. Finally, she left the
house and ran away from Fyodor Pavlovitch with a destitute divinity
student, leaving Mitya, a child of three years old, in her husband’s
hands. Immediately Fyodor Pavlovitch introduced a regular harem into the
house, and abandoned himself to orgies of drunkenness. In the intervals he
used to drive all over the province, complaining tearfully to each and all
of Adelaïda Ivanovna’s having left him, going into details too disgraceful
for a husband to mention in regard to his own married life. What seemed to
gratify him and flatter his self‐love most was to play the ridiculous part
of the injured husband, and to parade his woes with embellishments.

“One would think that you’d got a promotion, Fyodor Pavlovitch, you seem
so pleased in spite of your sorrow,” scoffers said to him. Many even added
that he was glad of a new comic part in which to play the buffoon, and
that it was simply to make it funnier that he pretended to be unaware of
his ludicrous position. But, who knows, it may have been simplicity. At
last he succeeded in getting on the track of his runaway wife. The poor
woman turned out to be in Petersburg, where she had gone with her divinity
student, and where she had thrown herself into a life of complete
emancipation. Fyodor Pavlovitch at once began bustling about, making
preparations to go to Petersburg, with what object he could not himself
have said. He would perhaps have really gone; but having determined to do
so he felt at once entitled to fortify himself for the journey by another
bout of reckless drinking. And just at that time his wife’s family
received the news of her death in Petersburg. She had died quite suddenly
in a garret, according to one story, of typhus, or as another version had
it, of starvation. Fyodor Pavlovitch was drunk when he heard of his wife’s
death, and the story is that he ran out into the street and began shouting
with joy, raising his hands to Heaven: “Lord, now lettest Thou Thy servant
depart in peace,” but others say he wept without restraint like a little
child, so much so that people were sorry for him, in spite of the
repulsion he inspired. It is quite possible that both versions were true,
that he rejoiced at his release, and at the same time wept for her who
released him. As a general rule, people, even the wicked, are much more
naïve and simple‐hearted than we suppose. And we ourselves are, too.



Chapter II. He Gets Rid Of His Eldest Son


You can easily imagine what a father such a man could be and how he would
bring up his children. His behavior as a father was exactly what might be
expected. He completely abandoned the child of his marriage with Adelaïda
Ivanovna, not from malice, nor because of his matrimonial grievances, but
simply because he forgot him. While he was wearying every one with his
tears and complaints, and turning his house into a sink of debauchery, a
faithful servant of the family, Grigory, took the three‐year‐old Mitya
into his care. If he hadn’t looked after him there would have been no one
even to change the baby’s little shirt.

It happened moreover that the child’s relations on his mother’s side
forgot him too at first. His grandfather was no longer living, his widow,
Mitya’s grandmother, had moved to Moscow, and was seriously ill, while his
daughters were married, so that Mitya remained for almost a whole year in
old Grigory’s charge and lived with him in the servant’s cottage. But if
his father had remembered him (he could not, indeed, have been altogether
unaware of his existence) he would have sent him back to the cottage, as
the child would only have been in the way of his debaucheries. But a
cousin of Mitya’s mother, Pyotr Alexandrovitch Miüsov, happened to return
from Paris. He lived for many years afterwards abroad, but was at that
time quite a young man, and distinguished among the Miüsovs as a man of
enlightened ideas and of European culture, who had been in the capitals
and abroad. Towards the end of his life he became a Liberal of the type
common in the forties and fifties. In the course of his career he had come
into contact with many of the most Liberal men of his epoch, both in
Russia and abroad. He had known Proudhon and Bakunin personally, and in
his declining years was very fond of describing the three days of the
Paris Revolution of February 1848, hinting that he himself had almost
taken part in the fighting on the barricades. This was one of the most
grateful recollections of his youth. He had an independent property of
about a thousand souls, to reckon in the old style. His splendid estate
lay on the outskirts of our little town and bordered on the lands of our
famous monastery, with which Pyotr Alexandrovitch began an endless
lawsuit, almost as soon as he came into the estate, concerning the rights
of fishing in the river or wood‐cutting in the forest, I don’t know
exactly which. He regarded it as his duty as a citizen and a man of
culture to open an attack upon the “clericals.” Hearing all about Adelaïda
Ivanovna, whom he, of course, remembered, and in whom he had at one time
been interested, and learning of the existence of Mitya, he intervened, in
spite of all his youthful indignation and contempt for Fyodor Pavlovitch.
He made the latter’s acquaintance for the first time, and told him
directly that he wished to undertake the child’s education. He used long
afterwards to tell as a characteristic touch, that when he began to speak
of Mitya, Fyodor Pavlovitch looked for some time as though he did not
understand what child he was talking about, and even as though he was
surprised to hear that he had a little son in the house. The story may
have been exaggerated, yet it must have been something like the truth.

Fyodor Pavlovitch was all his life fond of acting, of suddenly playing an
unexpected part, sometimes without any motive for doing so, and even to
his own direct disadvantage, as, for instance, in the present case. This
habit, however, is characteristic of a very great number of people, some
of them very clever ones, not like Fyodor Pavlovitch. Pyotr Alexandrovitch
carried the business through vigorously, and was appointed, with Fyodor
Pavlovitch, joint guardian of the child, who had a small property, a house
and land, left him by his mother. Mitya did, in fact, pass into this
cousin’s keeping, but as the latter had no family of his own, and after
securing the revenues of his estates was in haste to return at once to
Paris, he left the boy in charge of one of his cousins, a lady living in
Moscow. It came to pass that, settling permanently in Paris he, too,
forgot the child, especially when the Revolution of February broke out,
making an impression on his mind that he remembered all the rest of his
life. The Moscow lady died, and Mitya passed into the care of one of her
married daughters. I believe he changed his home a fourth time later on. I
won’t enlarge upon that now, as I shall have much to tell later of Fyodor
Pavlovitch’s firstborn, and must confine myself now to the most essential
facts about him, without which I could not begin my story.

In the first place, this Mitya, or rather Dmitri Fyodorovitch, was the
only one of Fyodor Pavlovitch’s three sons who grew up in the belief that
he had property, and that he would be independent on coming of age. He
spent an irregular boyhood and youth. He did not finish his studies at the
"""

var names: Set<String> = []

nameRegex.enumerateMatches(in: bookString, range: NSRange(location: 0, length: bookString.count)) {
    (result, _, stopPointer) in
    guard let result = result else { return }
    let name = nameRegex.replacementString(for: result,
                                           in: bookString, offset: 0, template: "$1 $2")
    names.insert(name)
    
    // stop once we've found six unique names
    stopPointer.pointee = ObjCBool(names.count == 6)
}
names
//

