package §_-bN§
{
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-hO§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-o1Q§;
   import views.§_-53z§;
   
   public class §_-Dn§ extends Dialog
   {
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16777215);
      
      private static const §_-aT§:TextFormat = new TextFormat(null,16,6763521,true);
      
      private static const §_-S2b§:GlowFilter = new GlowFilter(14796963,1,6,6,8);
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #6D4D37;","}"].join("\n");
      
      private static var _instance:§_-Dn§ = null;
      
      private var §_-H2Z§:uint;
      
      private var §_-Fq§:int = -1;
      
      private var §_-Z2K§:int = -1;
      
      private var §_-Sh§:Sprite = null;
      
      private var §_-q2l§:Sprite = null;
      
      private var §_-9r§:Array = [];
      
      private var §_-Q1w§:§_-i5§ = null;
      
      private var §_-Z11§:§_-i5§ = null;
      
      private var §_-a8§:Sprite = null;
      
      public function §_-Dn§()
      {
         super(gls("Миссии"),true,true,null,false);
         this.init();
         §_-kG§.addEventListener(GameEvent.DAILY_QUEST_CHANGED,this.update);
         §_-kG§.addEventListener(GameEvent.DAILY_QUEST_PROGRESS,this.§_-D16§);
         §_-kG§.addEventListener(GameEvent.§_-J7§,this.§_-G7§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-Dn§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-H2Z§ = Game.self.nuts;
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-On§);
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-K1j§]);
         §_-p1V§.§_-63T§(this.§_-L23§);
         §_-L1H§.hide(NotificationManager.DAILY_QUEST);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-LZ§.removeEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-On§);
         §_-hO§.removeEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-K1j§]);
         §_-p1V§.§_-B3x§(this.§_-L23§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,29,16763904,null,null,null,null,null,"center");
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-q2l§ = new EducationQuestGeneraImage();
         this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
         this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
         addChild(this.§_-Sh§);
         addChild(this.§_-q2l§);
         this.§_-Q1w§ = new §_-i5§("",38,233,§_-W2U§);
         this.§_-Q1w§.filters = [§_-S2b§];
         this.§_-q2l§.addChild(this.§_-Q1w§);
         var _loc2_:String = gls("Миссии - это дополнительные задачи во время игры с другими белочками. Выполни необходимые требования и возвращайся за наградой.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.");
         this.§_-Z11§ = new §_-i5§("<body>" + _loc2_ + "</body>",28,255,_loc1_,560);
         this.§_-q2l§.addChild(this.§_-Z11§);
         this.§_-a8§ = new Sprite();
         this.§_-a8§.x = 10;
         this.§_-a8§.y = 320;
         this.§_-a8§.graphics.beginFill(16777215,0.6);
         this.§_-a8§.graphics.drawRect(0,0,590,215);
         addChild(this.§_-a8§);
         this.update();
         place();
         this.width = 640;
         this.height = 590;
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc4_:§_-53z§ = null;
         if(Boolean(param1) && Boolean("onComplete" in param1) && Boolean(param1.data["onComplete"]))
         {
            if(this.§_-Sh§)
            {
               removeChild(this.§_-Sh§);
            }
            this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
            addChild(this.§_-Sh§);
            (this.§_-q2l§ as EducationQuestGeneraImage).imageShaman.visible = true;
            addChild(this.§_-q2l§);
            this.§_-Q1w§.text = "";
            this.§_-Z11§.text = "<body>" + gls("Отлично, ещё одна миссия завершена! Посмотри, что ещё шаман подготовил для тебя - выполняй больше, получай больше наград.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.") + "</body>";
         }
         while(this.§_-a8§.numChildren > 0)
         {
            this.§_-a8§.removeChildAt(0);
         }
         this.§_-9r§ = [];
         var _loc2_:Boolean = true;
         var _loc3_:int = 0;
         while(_loc3_ < §_-kG§.quests.length)
         {
            _loc4_ = new §_-53z§(§_-kG§.quests[_loc3_],this.§_-434§);
            _loc4_.x = 5;
            _loc4_.y = 10 + _loc3_ * 105;
            this.§_-a8§.addChild(_loc4_);
            this.§_-9r§.push(_loc4_);
            _loc2_ &&= !(§_-kG§.quests[_loc3_].type == this.§_-Fq§ && §_-kG§.quests[_loc3_].§_-w2Z§ == this.§_-Z2K§);
            _loc3_++;
         }
         if(_loc2_)
         {
            if(this.§_-Sh§)
            {
               removeChild(this.§_-Sh§);
            }
            this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
            addChild(this.§_-Sh§);
            (this.§_-q2l§ as EducationQuestGeneraImage).imageShaman.visible = true;
            addChild(this.§_-q2l§);
            this.§_-Q1w§.text = "";
            this.§_-Z11§.text = "<body>" + gls("Миссии - это дополнительные задачи во время игры с другими белочками. Выполни необходимые требования и возвращайся за наградой.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.") + "</body>";
         }
      }
      
      private function §_-L23§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-9r§.length)
         {
            if(§_-kG§.quests.length > _loc1_)
            {
               (this.§_-9r§[_loc1_] as §_-53z§).§_-L23§();
            }
            _loc1_++;
         }
      }
      
      private function §_-G7§(param1:GameEvent) : void
      {
         §_-t2c§.addCallback(this.show);
      }
      
      private function §_-D16§(param1:GameEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-9r§.length)
         {
            if(§_-kG§.quests.length > _loc2_)
            {
               (this.§_-9r§[_loc2_] as §_-53z§).update();
            }
            _loc2_++;
         }
      }
      
      private function §_-434§(param1:§_-u1x§) : void
      {
         this.§_-Fq§ = param1.type;
         this.§_-Z2K§ = param1.§_-w2Z§;
         if(this.§_-Sh§)
         {
            removeChild(this.§_-Sh§);
         }
         this.§_-Sh§ = param1.image;
         this.§_-Sh§.x = this.§_-q2l§.x + int((this.§_-q2l§.width - this.§_-Sh§.width) * 0.5);
         addChild(this.§_-Sh§);
         (this.§_-q2l§ as EducationQuestGeneraImage).imageShaman.visible = false;
         addChild(this.§_-q2l§);
         this.§_-Q1w§.text = param1.name;
         this.§_-Z11§.text = "<body>" + param1.text + "</body>";
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[2] == §_-s2l§.§_-C3Y§)
         {
            this.showAward(param1[1] - this.§_-H2Z§,ImageIconNut);
         }
         this.§_-H2Z§ = param1[1];
      }
      
      private function §_-On§(param1:GameEvent) : void
      {
         if(!param1.data || param1.data["reason"] != §_-s2l§.§_-C3Y§)
         {
            return;
         }
         this.showAward(param1.data["delta"],ImageIconExp,103);
      }
      
      private function §_-o2X§(param1:GameEvent) : void
      {
         if(!param1.data || param1.data["reason"] != §_-s2l§.§_-C3Y§)
         {
            return;
         }
         this.showAward(param1.data["delta"],ImageIconMana,50);
      }
      
      private function showAward(param1:int, param2:Class, param3:int = 0) : void
      {
         if(param1 == 0)
         {
            return;
         }
         §_-o1Q§.§_-K2u§(this.x + 290 + param3,this.y + 420,param1,§_-o1Q§.§_-Hw§(param2),param2,1.2,§_-aT§);
      }
   }
}

