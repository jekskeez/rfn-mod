package §_-ZL§
{
   import §_-B1G§.ScrollPane;
   import §_-bN§.Dialog;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-Rp§;
   import §_-v2M§.§_-A3f§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.FileReference;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   
   public class §_-3H§ extends Dialog
   {
      
      private static const §_-aD§:String = ["body{","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-n1Q§:TextFormat = new TextFormat(null,12,0,true);
      
      private static var _instance:§_-3H§ = null;
      
      public static var §_-rD§:§_-A3f§ = new §_-A3f§();
      
      private var style:StyleSheet;
      
      private var §_-m2o§:FileReference = new FileReference();
      
      private var §_-Z2k§:FileReference = new FileReference();
      
      private var §_-W18§:ScrollPane;
      
      private var sprite:Sprite;
      
      private var §_-a1O§:§_-K2G§ = null;
      
      private var §_-53M§:§_-K2G§ = null;
      
      private var §_-n15§:§_-K2G§ = null;
      
      private var §_-j2D§:§_-K2G§ = null;
      
      private var §_-o2w§:§_-i5§;
      
      private var game:§_-62b§;
      
      private var §_-K1m§:Object = [];
      
      private var §_-P4§:Boolean = false;
      
      public function §_-3H§()
      {
         super("");
         this.init();
      }
      
      public static function §_-Hd§() : void
      {
         if(Boolean(_instance) && _instance.visible)
         {
            _instance.hide();
         }
      }
      
      public static function show(param1:§_-62b§) : void
      {
         if(_instance == null)
         {
            _instance = new §_-3H§();
         }
         _instance.game = param1;
         _instance.show();
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.§_-o2w§ = new §_-i5§(gls("ПОВТОР"),0,0,new TextFormat(null,25,16711680,true));
         this.§_-o2w§.x = (Game.starling.stage.stageWidth - this.§_-o2w§.width) * 0.5;
         this.§_-o2w§.y = (Game.starling.stage.stageHeight - this.§_-o2w§.height) * 0.5;
         this.§_-o2w§.visible = false;
         Game.§_-q1L§.addChild(this.§_-o2w§);
         this.sprite = new Sprite();
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.x = 10;
         this.§_-W18§.y = 90;
         this.§_-W18§.setSize(505,280);
         this.§_-W18§.source = this.sprite;
         addChild(this.§_-W18§);
         this.§_-a1O§ = new §_-K2G§(gls("Записать"));
         this.§_-a1O§.x = 5;
         this.§_-a1O§.y = 380;
         this.§_-a1O§.addEventListener(MouseEvent.CLICK,this.§_-DP§);
         addChild(this.§_-a1O§);
         this.§_-53M§ = new §_-K2G§(gls("Импорт"));
         this.§_-53M§.x = 110;
         this.§_-53M§.y = 380;
         this.§_-53M§.addEventListener(MouseEvent.CLICK,this.§_-w4§);
         addChild(this.§_-53M§);
         this.§_-j2D§ = new §_-K2G§(gls("Добавить"));
         this.§_-j2D§.x = 215;
         this.§_-j2D§.y = 380;
         this.§_-j2D§.addEventListener(MouseEvent.CLICK,this.§_-uh§);
         addChild(this.§_-j2D§);
         this.§_-n15§ = new §_-K2G§(gls("Экспорт"));
         this.§_-n15§.x = 320;
         this.§_-n15§.y = 380;
         this.§_-n15§.addEventListener(MouseEvent.CLICK,this.§_-J1I§);
         addChild(this.§_-n15§);
         this.§_-Ts§();
         place();
         this.width = 580;
         this.height = 450;
      }
      
      private function §_-uh§(param1:MouseEvent) : void
      {
         this.§_-P4§ = true;
         this.§_-w4§(param1);
      }
      
      private function §_-J1I§(param1:MouseEvent) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.position = 0;
         _loc2_.writeUTF(JSON.stringify(this.§_-K1m§));
         this.§_-Z2k§.save(JSON.stringify(this.§_-K1m§),"all.action");
      }
      
      private function §_-5s§(param1:MouseEvent) : void
      {
         var _loc2_:int = (param1.currentTarget as §_-i5§).userData;
         this.§_-Z2k§.save(JSON.stringify(this.§_-K1m§[_loc2_]),_loc2_ + ".action");
      }
      
      private function §_-w4§(param1:MouseEvent) : void
      {
         §_-73Q§.§_-R1R§ = false;
         this.§_-m2o§.browse();
         this.§_-m2o§.addEventListener(Event.SELECT,this.§_-h1u§);
      }
      
      private function §_-h1u§(param1:Event) : void
      {
         this.§_-m2o§.load();
         this.§_-m2o§.addEventListener(Event.COMPLETE,this.onLoaded);
      }
      
      private function onLoaded(param1:Event) : void
      {
         this.§_-m2o§.data.position = 0;
         var _loc2_:Object = JSON.parse(this.§_-m2o§.data.readUTF());
         if(this.§_-P4§)
         {
            this.§_-K1m§ = this.§_-K1m§.concat(_loc2_);
         }
         else
         {
            this.§_-K1m§ = _loc2_;
         }
         this.§_-Ts§();
      }
      
      private function §_-DP§(param1:MouseEvent) : void
      {
         if(§_-rD§.§_-RR§)
         {
            §_-rD§.§_-H2G§();
            this.game.§_-61A§();
            this.§_-K1m§.push(§_-rD§.actions);
            this.§_-43B§();
            this.§_-Ts§();
            return;
         }
         §_-rD§.actions = [];
         §_-rD§.§_-D2C§();
         this.§_-43B§();
         this.game.§_-43X§();
         hide();
      }
      
      private function §_-Ts§() : void
      {
         var _loc2_:§_-i5§ = null;
         var _loc3_:§_-i5§ = null;
         var _loc4_:§_-i5§ = null;
         var _loc5_:§_-i5§ = null;
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-K1m§.length)
         {
            this.sprite.addChild(new §_-i5§((_loc1_ + 1).toString(),0,_loc1_ * 20,§_-n1Q§));
            this.sprite.addChild(new §_-i5§(this.game.§_-91A§.toString(),50,_loc1_ * 20,§_-n1Q§));
            _loc2_ = this.sprite.addChild(new §_-i5§(gls("<body><a class=\'name\' href=\'event:replay\'>Проиграть</a></body>"),150,_loc1_ * 20,this.style)) as §_-i5§;
            _loc2_.userData = _loc1_;
            _loc2_.addEventListener(MouseEvent.CLICK,this.§_-I9§);
            _loc3_ = this.sprite.addChild(new §_-i5§(gls("<body><a class=\'name\' href=\'event:continue\'>Продолжить</a></body>"),240,_loc1_ * 20,this.style)) as §_-i5§;
            _loc3_.userData = _loc1_;
            _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Z10§);
            _loc4_ = this.sprite.addChild(new §_-i5§(gls("<body><a class=\'name\' href=\'event:export\'>Экспорт</a></body>"),330,_loc1_ * 20,this.style)) as §_-i5§;
            _loc4_.userData = _loc1_;
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-5s§);
            _loc5_ = this.sprite.addChild(new §_-i5§(gls("<body><a class=\'name\' href=\'event:delete\'>Удалить</a></body>"),400,_loc1_ * 20,this.style)) as §_-i5§;
            _loc5_.userData = _loc1_;
            _loc5_.addEventListener(MouseEvent.CLICK,this.§_-73C§);
            _loc1_++;
         }
         if(!this.§_-K1m§.length)
         {
            this.sprite.addChild(new §_-i5§(gls("Нет записей"),200,100,§_-n1Q§));
         }
         this.§_-W18§.update();
      }
      
      private function §_-73C§(param1:MouseEvent) : void
      {
         if(this.§_-K1m§.length == 1)
         {
            this.§_-K1m§ = [];
         }
         else
         {
            this.§_-K1m§.splice((param1.currentTarget as §_-i5§).userData,1);
         }
         this.§_-Ts§();
      }
      
      private function §_-Z10§(param1:MouseEvent) : void
      {
         §_-rD§.actions = this.§_-K1m§[(param1.currentTarget as §_-i5§).userData];
         §_-rD§.§_-H1E§(this.§_-C3§);
         §_-rD§.§_-dP§();
         this.game.§_-43X§();
         hide();
      }
      
      private function §_-C3§() : void
      {
         (this.game.squirrels as §_-Rp§).selfHeroId = (this.game.squirrels as §_-Rp§).selfHeroId;
         this.§_-o2w§.visible = false;
         §_-rD§.actions = [];
         §_-rD§.§_-D2C§();
         this.§_-43B§();
      }
      
      private function §_-43B§() : void
      {
         if(§_-rD§.§_-RR§)
         {
            this.§_-a1O§.field.text = gls("Остановить");
         }
         else
         {
            this.§_-a1O§.field.text = gls("Записать");
         }
      }
      
      private function §_-I9§(param1:MouseEvent) : void
      {
         §_-rD§.actions = this.§_-K1m§[(param1.currentTarget as §_-i5§).userData];
         §_-rD§.§_-H1E§(this.§_-I1w§);
         §_-rD§.§_-dP§();
         this.game.§_-43X§();
         hide();
         this.§_-o2w§.visible = true;
      }
      
      private function §_-I1w§() : void
      {
         this.game.§_-61A§();
         this.show();
         this.§_-o2w§.visible = false;
      }
   }
}

