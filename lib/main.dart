import 'package:flutter/material.dart';

void main() => runApp(GrammarApp());

class GrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Grammar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ---------- Data Models ----------
class Topic {
  final String name;
  final String description;
  final List<Lesson> lessons;
  final List<QuizQuestion> quizQuestions;
  Topic({required this.name, required this.description, required this.lessons, required this.quizQuestions});
}

class Lesson {
  final String title;
  final String content;
  Lesson({required this.title, required this.content});
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  QuizQuestion({required this.question, required this.options, required this.correctIndex});
}

List<Topic> getGrammarTopics() {
  return [
    Topic(
      name: 'Tenses',
      description: 'Learn all tenses: Present, Past, Future, Perfect, Continuous.',
      lessons: [
        Lesson(title: 'Present Simple', content: 'Structure: Subject + base verb (add -s for he/she/it)\nUse: habits, facts, routines.\nExamples:\n- I work.\n- She works.\n- They play.'),
        Lesson(title: 'Present Continuous', content: 'Structure: Subject + am/is/are + verb-ing\nUse: actions happening now.\nExamples:\n- I am working.\n- She is sleeping.\n- They are playing.'),
        Lesson(title: 'Present Perfect', content: 'Structure: Subject + have/has + past participle\nUse: past actions with present relevance.\nExamples:\n- I have finished.\n- She has gone.'),
        Lesson(title: 'Past Simple', content: 'Structure: Subject + past form\nUse: completed past actions.\nExamples:\n- I worked.\n- She went.'),
        Lesson(title: 'Past Continuous', content: 'Structure: Subject + was/were + verb-ing\nUse: ongoing past actions.\nExamples:\n- I was sleeping.\n- They were playing.'),
        Lesson(title: 'Future Simple', content: 'Structure: Subject + will + base verb\nUse: future predictions, decisions.\nExamples:\n- I will call you.\n- She will come.'),
      ],
      quizQuestions: [
        QuizQuestion(question: 'Which tense is used for habits?', options: ['Present Simple', 'Past Simple', 'Future Simple', 'Present Continuous'], correctIndex: 0),
        QuizQuestion(question: 'Identify the tense: "She has finished her homework."', options: ['Past Simple', 'Present Perfect', 'Present Continuous', 'Future Simple'], correctIndex: 1),
        QuizQuestion(question: 'Choose the correct form: "They _____ playing football now."', options: ['are', 'is', 'were', 'will'], correctIndex: 0),
      ],
    ),
    Topic(
      name: 'Direct & Indirect Speech',
      description: 'Learn how to convert direct speech into indirect (reported) speech.',
      lessons: [
        Lesson(title: 'Rules for Reported Speech', content: '1. Remove quotation marks.\n2. Change pronouns (I → he/she, we → they, etc.)\n3. Change tenses (present → past, past → past perfect, etc.)\n4. Change time words (now → then, today → that day, etc.)\n\nExample:\nDirect: She said, "I am happy."\nIndirect: She said that she was happy.'),
        Lesson(title: 'Tense Changes in Reported Speech', content: 'Present Simple → Past Simple\nPresent Continuous → Past Continuous\nPresent Perfect → Past Perfect\nPast Simple → Past Perfect\nwill → would\ncan → could\n\nExample:\n"I will come" → He said he would come.'),
        Lesson(title: 'Reporting Questions', content: 'For yes/no questions: use "if" or "whether".\nFor wh-questions: keep the question word.\nChange the word order to statement form.\n\nExamples:\nDirect: "Do you like coffee?" → He asked if I liked coffee.\nDirect: "Where are you going?" → He asked where I was going.'),
      ],
      quizQuestions: [
        QuizQuestion(question: 'Convert to indirect: She said, "I am tired."', options: ['She said that she is tired.', 'She said that she was tired.', 'She said that I am tired.', 'She said that she tired.'], correctIndex: 1),
        QuizQuestion(question: 'Which tense changes to past perfect?', options: ['Present Simple', 'Past Simple', 'Present Perfect', 'Future Simple'], correctIndex: 1),
        QuizQuestion(question: 'Convert: He asked, "Where do you live?"', options: ['He asked where you live.', 'He asked where I lived.', 'He asked where did I live.', 'He asked where I live.'], correctIndex: 1),
      ],
    ),
  ];
}

class TenseConverter {
  static String convertTense(String sentence, String sourceTense, String targetTense) {
    return "Conversion from $sourceTense to $targetTense:\n\nInput: $sentence\n\n(Note: Full tense conversion is complex. This is a learning tool.)";
  }
}

class SpeechConverter {
  static String convertToIndirect(String direct) {
    if (!direct.contains('"')) return "Please use quotes (e.g., She said, \"...\")";
    String withoutQuotes = direct.replaceAll('"', '');
    return withoutQuotes.replaceFirst('I', 'he/she');
  }
}

// ---------- Screens ----------
class HomeScreen extends StatelessWidget {
  final List<Topic> topics = getGrammarTopics();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('English Grammar'), centerTitle: true),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            color: Colors.blue.shade50,
            child: ListTile(
              leading: Icon(Icons.transform, color: Colors.blue),
              title: Text('Tense Converter', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Convert between any tenses'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TenseConverterScreen())),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            color: Colors.green.shade50,
            child: ListTile(
              leading: Icon(Icons.chat, color: Colors.green),
              title: Text('Direct/Indirect Speech', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Convert direct speech to indirect'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechConverterScreen())),
            ),
          ),
          ...topics.map((topic) => Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              title: Text(topic.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(topic.description),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TopicDetailScreen(topic: topic))),
            ),
          )),
        ],
      ),
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  TopicDetailScreen({required this.topic});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: topic.lessons.length,
              itemBuilder: (context, index) {
                final lesson = topic.lessons[index];
                return ListTile(
                  leading: Icon(Icons.book),
                  title: Text(lesson.title),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LessonScreen(lesson: lesson))),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(questions: topic.quizQuestions, topicName: topic.name))),
              child: Text('Take Quiz'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonScreen extends StatelessWidget {
  final Lesson lesson;
  LessonScreen({required this.lesson});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(child: Text(lesson.content, style: TextStyle(fontSize: 16, height: 1.5))),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String topicName;
  QuizScreen({required this.questions, required this.topicName});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;
  int? selectedOptionIndex;

  void checkAnswer(int optionIndex) {
    if (selectedOptionIndex != null) return;
    setState(() {
      selectedOptionIndex = optionIndex;
      if (optionIndex == widget.questions[currentQuestionIndex].correctIndex) score++;
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex + 1 < widget.questions.length) {
      setState(() { currentQuestionIndex++; selectedOptionIndex = null; });
    } else {
      setState(() { quizCompleted = true; });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0; score = 0; quizCompleted = false; selectedOptionIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Score', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('$score / ${widget.questions.length}', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue)),
              SizedBox(height: 30),
              ElevatedButton(onPressed: restartQuiz, child: Text('Try Again')),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Back to Topic')),
            ],
          ),
        ),
      );
    }

    final question = widget.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.topicName} Quiz')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Question ${currentQuestionIndex+1} of ${widget.questions.length}', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            SizedBox(height: 20),
            Text(question.question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: selectedOptionIndex == null ? () => checkAnswer(index) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedOptionIndex == index ? (index == question.correctIndex ? Colors.green : Colors.red) : null,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(question.options[index]),
                ),
              );
            }),
            Spacer(),
            if (selectedOptionIndex != null)
              ElevatedButton(onPressed: nextQuestion, child: Text(currentQuestionIndex+1 < widget.questions.length ? 'Next Question' : 'Finish')),
          ],
        ),
      ),
    );
  }
}

class TenseConverterScreen extends StatefulWidget {
  @override
  _TenseConverterScreenState createState() => _TenseConverterScreenState();
}

class _TenseConverterScreenState extends State<TenseConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _output = '';
  String _selectedSource = 'Present Simple';
  String _selectedTarget = 'Past Simple';
  final List<String> tenses = ['Present Simple', 'Present Continuous', 'Present Perfect', 'Past Simple', 'Past Continuous', 'Past Perfect', 'Future Simple', 'Future Continuous', 'Future Perfect'];

  void _convert() {
    String input = _inputController.text.trim();
    if (input.isEmpty) { setState(() { _output = 'Please enter a sentence.'; }); return; }
    setState(() { _output = TenseConverter.convertTense(input, _selectedSource, _selectedTarget); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tense Converter')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select source tense:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(value: _selectedSource, items: tenses.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(), onChanged: (v) => setState(() => _selectedSource = v!)),
            SizedBox(height: 16),
            Text('Select target tense:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(value: _selectedTarget, items: tenses.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(), onChanged: (v) => setState(() => _selectedTarget = v!)),
            SizedBox(height: 20),
            TextField(controller: _inputController, decoration: InputDecoration(hintText: 'Enter sentence here...', border: OutlineInputBorder()), maxLines: 3),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _convert, child: Text('Convert'), style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 14))),
            SizedBox(height: 20),
            if (_output.isNotEmpty) Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)), child: Text(_output)),
          ],
        ),
      ),
    );
  }
}

class SpeechConverterScreen extends StatefulWidget {
  @override
  _SpeechConverterScreenState createState() => _SpeechConverterScreenState();
}

class _SpeechConverterScreenState extends State<SpeechConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _output = '';
  void _convert() {
    String input = _inputController.text.trim();
    if (input.isEmpty) { setState(() { _output = 'Please enter a direct speech sentence.'; }); return; }
    setState(() { _output = SpeechConverter.convertToIndirect(input); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Direct/Indirect Speech Converter')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter a sentence in direct speech (with quotes):', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Example: She said, "I am going."', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            SizedBox(height: 12),
            TextField(controller: _inputController, decoration: InputDecoration(hintText: 'e.g., He said, "I like pizza."', border: OutlineInputBorder()), maxLines: 3),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _convert, child: Text('Convert to Indirect Speech'), style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 14))),
            SizedBox(height: 20),
            if (_output.isNotEmpty) Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Indirect Speech:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 8), Text(_output)])),
          ],
        ),
      ),
    );
  }
}
