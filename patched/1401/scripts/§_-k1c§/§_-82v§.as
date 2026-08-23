package §_-k1c§
{
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-71o§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-r2N§;
   import views.§_-jk§;
   
   public class §_-82v§ extends Dialog
   {
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16777215);
      
      private static const §_-z1f§:TextFormat = new TextFormat(null,16,6763521,true);
      
      private static const §_-Qe§:GlowFilter = new GlowFilter(14796963,1,6,6,8);
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #6D4D37;","}"].join("\n");
      
      private static var _instance:§_-82v§ = null;
      
      private var §_-l1A§:uint;
      
      private var §_-U8§:int = -1;
      
      private var §_-12D§:int = -1;
      
      private var §_-ys§:Sprite = null;
      
      private var §_-i2b§:Sprite = null;
      
      private var §_-22c§:Array = [];
      
      private var §_-T1j§:§_-22V§ = null;
      
      private var §_-n2P§:§_-22V§ = null;
      
      private var §_-f2n§:Sprite = null;
      
      public function §_-82v§()
      {
         super(gls("Миссии"),true,true,null,false);
         this.init();
         §_-R1c§.addEventListener(GameEvent.DAILY_QUEST_CHANGED,this.update);
         §_-R1c§.addEventListener(GameEvent.DAILY_QUEST_PROGRESS,this.§_-E2X§);
         §_-R1c§.addEventListener(GameEvent.§_-O1U§,this.§_-A1g§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-82v§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-l1A§ = Game.self.nuts;
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-iE§);
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-s1J§]);
         §_-01Y§.§_-c9§(this.§_-I9§);
         §_-fO§.hide(NotificationManager.DAILY_QUEST);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-d2x§.removeEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-iE§);
         §_-Z1F§.removeEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-s1J§]);
         §_-01Y§.§_-l2K§(this.§_-I9§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,29,16763904,null,null,null,null,null,"center");
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-i2b§ = new EducationQuestGeneraImage();
         this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
         this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
         addChild(this.§_-ys§);
         addChild(this.§_-i2b§);
         this.§_-T1j§ = new §_-22V§("",38,233,§_-a1Y§);
         this.§_-T1j§.filters = [§_-Qe§];
         this.§_-i2b§.addChild(this.§_-T1j§);
         var _loc2_:String = gls("Миссии - это дополнительные задачи во время игры с другими белочками. Выполни необходимые требования и возвращайся за наградой.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.");
         this.§_-n2P§ = new §_-22V§("<body>" + _loc2_ + "</body>",28,255,_loc1_,560);
         this.§_-i2b§.addChild(this.§_-n2P§);
         this.§_-f2n§ = new Sprite();
         this.§_-f2n§.x = 10;
         this.§_-f2n§.y = 320;
         this.§_-f2n§.graphics.beginFill(16777215,0.6);
         this.§_-f2n§.graphics.drawRect(0,0,590,215);
         addChild(this.§_-f2n§);
         this.update();
         place();
         this.width = 640;
         this.height = 590;
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc4_:§_-jk§ = null;
         if(Boolean(param1) && Boolean("onComplete" in param1) && Boolean(param1.data["onComplete"]))
         {
            if(this.§_-ys§)
            {
               removeChild(this.§_-ys§);
            }
            this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
            addChild(this.§_-ys§);
            (this.§_-i2b§ as EducationQuestGeneraImage).imageShaman.visible = true;
            addChild(this.§_-i2b§);
            this.§_-T1j§.text = "";
            this.§_-n2P§.text = "<body>" + gls("Отлично, ещё одна миссия завершена! Посмотри, что ещё шаман подготовил для тебя - выполняй больше, получай больше наград.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.") + "</body>";
         }
         while(this.§_-f2n§.numChildren > 0)
         {
            this.§_-f2n§.removeChildAt(0);
         }
         this.§_-22c§ = [];
         var _loc2_:Boolean = true;
         var _loc3_:int = 0;
         while(_loc3_ < §_-R1c§.quests.length)
         {
            _loc4_ = new §_-jk§(§_-R1c§.quests[_loc3_],this.§_-R1u§);
            _loc4_.x = 5;
            _loc4_.y = 10 + _loc3_ * 105;
            this.§_-f2n§.addChild(_loc4_);
            this.§_-22c§.push(_loc4_);
            _loc2_ &&= !(§_-R1c§.quests[_loc3_].type == this.§_-U8§ && §_-R1c§.quests[_loc3_].§_-QN§ == this.§_-12D§);
            _loc3_++;
         }
         if(_loc2_)
         {
            if(this.§_-ys§)
            {
               removeChild(this.§_-ys§);
            }
            this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
            addChild(this.§_-ys§);
            (this.§_-i2b§ as EducationQuestGeneraImage).imageShaman.visible = true;
            addChild(this.§_-i2b§);
            this.§_-T1j§.text = "";
            this.§_-n2P§.text = "<body>" + gls("Миссии - это дополнительные задачи во время игры с другими белочками. Выполни необходимые требования и возвращайся за наградой.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о миссии.") + "</body>";
         }
      }
      
      private function §_-I9§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-22c§.length)
         {
            if(§_-R1c§.quests.length > _loc1_)
            {
               (this.§_-22c§[_loc1_] as §_-jk§).§_-I9§();
            }
            _loc1_++;
         }
      }
      
      private function §_-A1g§(param1:GameEvent) : void
      {
         §_-71o§.addCallback(this.show);
      }
      
      private function §_-E2X§(param1:GameEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-22c§.length)
         {
            if(§_-R1c§.quests.length > _loc2_)
            {
               (this.§_-22c§[_loc2_] as §_-jk§).update();
            }
            _loc2_++;
         }
      }
      
      private function §_-R1u§(param1:§_-QP§) : void
      {
         this.§_-U8§ = param1.type;
         this.§_-12D§ = param1.§_-QN§;
         if(this.§_-ys§)
         {
            removeChild(this.§_-ys§);
         }
         this.§_-ys§ = param1.image;
         this.§_-ys§.x = this.§_-i2b§.x + int((this.§_-i2b§.width - this.§_-ys§.width) * 0.5);
         addChild(this.§_-ys§);
         (this.§_-i2b§ as EducationQuestGeneraImage).imageShaman.visible = false;
         addChild(this.§_-i2b§);
         this.§_-T1j§.text = param1.name;
         this.§_-n2P§.text = "<body>" + param1.text + "</body>";
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[2] == §_-S2I§.§_-E1H§)
         {
            this.showAward(param1[1] - this.§_-l1A§,ImageIconNut);
         }
         this.§_-l1A§ = param1[1];
      }
      
      private function §_-iE§(param1:GameEvent) : void
      {
         if(!param1.data || param1.data["reason"] != §_-S2I§.§_-E1H§)
         {
            return;
         }
         this.showAward(param1.data["delta"],ImageIconExp,103);
      }
      
      private function §_-sG§(param1:GameEvent) : void
      {
         if(!param1.data || param1.data["reason"] != §_-S2I§.§_-E1H§)
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
         §_-r2N§.§_-A3v§(this.x + 290 + param3,this.y + 420,param1,§_-r2N§.§_-o1o§(param2),param2,1.2,§_-z1f§);
      }
   }
}

