package §_-Q1P§
{
   import §_-F1E§.§_-41e§;
   import §_-Kr§.ScrollPane;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-W28§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.FileReference;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   
   public class §_-V10§ extends Dialog
   {
      
      private static const §_-I2U§:String = ["body{","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-PB§:TextFormat = new TextFormat(null,12,0,true);
      
      private static var _instance:§_-V10§ = null;
      
      public static var §_-c0§:§_-41e§ = new §_-41e§();
      
      private var style:StyleSheet;
      
      private var §_-c2k§:FileReference = new FileReference();
      
      private var §_-O1K§:FileReference = new FileReference();
      
      private var §_-M1N§:ScrollPane;
      
      private var sprite:Sprite;
      
      private var §_-E1D§:§_-j18§ = null;
      
      private var §_-P2T§:§_-j18§ = null;
      
      private var §_-f2D§:§_-j18§ = null;
      
      private var §_-v1x§:§_-j18§ = null;
      
      private var §_-6l§:§_-22V§;
      
      private var game:§_-A32§;
      
      private var §_-s1U§:Object = [];
      
      private var §_-D2z§:Boolean = false;
      
      public function §_-V10§()
      {
         super("");
         this.init();
      }
      
      public static function §_-J16§() : void
      {
         if(Boolean(_instance) && _instance.visible)
         {
            _instance.hide();
         }
      }
      
      public static function show(param1:§_-A32§) : void
      {
         if(_instance == null)
         {
            _instance = new §_-V10§();
         }
         _instance.game = param1;
         _instance.show();
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.§_-6l§ = new §_-22V§(gls("ПОВТОР"),0,0,new TextFormat(null,25,16711680,true));
         this.§_-6l§.x = (Game.starling.stage.stageWidth - this.§_-6l§.width) * 0.5;
         this.§_-6l§.y = (Game.starling.stage.stageHeight - this.§_-6l§.height) * 0.5;
         this.§_-6l§.visible = false;
         Game.§_-d2t§.addChild(this.§_-6l§);
         this.sprite = new Sprite();
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.x = 10;
         this.§_-M1N§.y = 90;
         this.§_-M1N§.setSize(505,280);
         this.§_-M1N§.source = this.sprite;
         addChild(this.§_-M1N§);
         this.§_-E1D§ = new §_-j18§(gls("Записать"));
         this.§_-E1D§.x = 5;
         this.§_-E1D§.y = 380;
         this.§_-E1D§.addEventListener(MouseEvent.CLICK,this.§_-tr§);
         addChild(this.§_-E1D§);
         this.§_-P2T§ = new §_-j18§(gls("Импорт"));
         this.§_-P2T§.x = 110;
         this.§_-P2T§.y = 380;
         this.§_-P2T§.addEventListener(MouseEvent.CLICK,this.§_-l1Z§);
         addChild(this.§_-P2T§);
         this.§_-v1x§ = new §_-j18§(gls("Добавить"));
         this.§_-v1x§.x = 215;
         this.§_-v1x§.y = 380;
         this.§_-v1x§.addEventListener(MouseEvent.CLICK,this.§_-Vo§);
         addChild(this.§_-v1x§);
         this.§_-f2D§ = new §_-j18§(gls("Экспорт"));
         this.§_-f2D§.x = 320;
         this.§_-f2D§.y = 380;
         this.§_-f2D§.addEventListener(MouseEvent.CLICK,this.§_-A3Z§);
         addChild(this.§_-f2D§);
         this.§_-21l§();
         place();
         this.width = 580;
         this.height = 450;
      }
      
      private function §_-Vo§(param1:MouseEvent) : void
      {
         this.§_-D2z§ = true;
         this.§_-l1Z§(param1);
      }
      
      private function §_-A3Z§(param1:MouseEvent) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.position = 0;
         _loc2_.writeUTF(JSON.stringify(this.§_-s1U§));
         this.§_-O1K§.save(JSON.stringify(this.§_-s1U§),"all.action");
      }
      
      private function §_-5F§(param1:MouseEvent) : void
      {
         var _loc2_:int = (param1.currentTarget as §_-22V§).userData;
         this.§_-O1K§.save(JSON.stringify(this.§_-s1U§[_loc2_]),_loc2_ + ".action");
      }
      
      private function §_-l1Z§(param1:MouseEvent) : void
      {
         §_-K1r§.§_-O1P§ = false;
         this.§_-c2k§.browse();
         this.§_-c2k§.addEventListener(Event.SELECT,this.§_-91N§);
      }
      
      private function §_-91N§(param1:Event) : void
      {
         this.§_-c2k§.load();
         this.§_-c2k§.addEventListener(Event.COMPLETE,this.onLoaded);
      }
      
      private function onLoaded(param1:Event) : void
      {
         this.§_-c2k§.data.position = 0;
         var _loc2_:Object = JSON.parse(this.§_-c2k§.data.readUTF());
         if(this.§_-D2z§)
         {
            this.§_-s1U§ = this.§_-s1U§.concat(_loc2_);
         }
         else
         {
            this.§_-s1U§ = _loc2_;
         }
         this.§_-21l§();
      }
      
      private function §_-tr§(param1:MouseEvent) : void
      {
         if(§_-c0§.§_-o2Q§)
         {
            §_-c0§.§_-k29§();
            this.game.§_-V2z§();
            this.§_-s1U§.push(§_-c0§.actions);
            this.§_-jg§();
            this.§_-21l§();
            return;
         }
         §_-c0§.actions = [];
         §_-c0§.§_-710§();
         this.§_-jg§();
         this.game.§_-731§();
         hide();
      }
      
      private function §_-21l§() : void
      {
         var _loc2_:§_-22V§ = null;
         var _loc3_:§_-22V§ = null;
         var _loc4_:§_-22V§ = null;
         var _loc5_:§_-22V§ = null;
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-s1U§.length)
         {
            this.sprite.addChild(new §_-22V§((_loc1_ + 1).toString(),0,_loc1_ * 20,§_-PB§));
            this.sprite.addChild(new §_-22V§(this.game.§_-r1L§.toString(),50,_loc1_ * 20,§_-PB§));
            _loc2_ = this.sprite.addChild(new §_-22V§(gls("<body><a class=\'name\' href=\'event:replay\'>Проиграть</a></body>"),150,_loc1_ * 20,this.style)) as §_-22V§;
            _loc2_.userData = _loc1_;
            _loc2_.addEventListener(MouseEvent.CLICK,this.§_-II§);
            _loc3_ = this.sprite.addChild(new §_-22V§(gls("<body><a class=\'name\' href=\'event:continue\'>Продолжить</a></body>"),240,_loc1_ * 20,this.style)) as §_-22V§;
            _loc3_.userData = _loc1_;
            _loc3_.addEventListener(MouseEvent.CLICK,this.§_-F1e§);
            _loc4_ = this.sprite.addChild(new §_-22V§(gls("<body><a class=\'name\' href=\'event:export\'>Экспорт</a></body>"),330,_loc1_ * 20,this.style)) as §_-22V§;
            _loc4_.userData = _loc1_;
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-5F§);
            _loc5_ = this.sprite.addChild(new §_-22V§(gls("<body><a class=\'name\' href=\'event:delete\'>Удалить</a></body>"),400,_loc1_ * 20,this.style)) as §_-22V§;
            _loc5_.userData = _loc1_;
            _loc5_.addEventListener(MouseEvent.CLICK,this.§_-hz§);
            _loc1_++;
         }
         if(!this.§_-s1U§.length)
         {
            this.sprite.addChild(new §_-22V§(gls("Нет записей"),200,100,§_-PB§));
         }
         this.§_-M1N§.update();
      }
      
      private function §_-hz§(param1:MouseEvent) : void
      {
         if(this.§_-s1U§.length == 1)
         {
            this.§_-s1U§ = [];
         }
         else
         {
            this.§_-s1U§.splice((param1.currentTarget as §_-22V§).userData,1);
         }
         this.§_-21l§();
      }
      
      private function §_-F1e§(param1:MouseEvent) : void
      {
         §_-c0§.actions = this.§_-s1U§[(param1.currentTarget as §_-22V§).userData];
         §_-c0§.§_-k25§(this.§_-ba§);
         §_-c0§.§_-L1C§();
         this.game.§_-731§();
         hide();
      }
      
      private function §_-ba§() : void
      {
         (this.game.squirrels as §_-W28§).selfHeroId = (this.game.squirrels as §_-W28§).selfHeroId;
         this.§_-6l§.visible = false;
         §_-c0§.actions = [];
         §_-c0§.§_-710§();
         this.§_-jg§();
      }
      
      private function §_-jg§() : void
      {
         if(§_-c0§.§_-o2Q§)
         {
            this.§_-E1D§.field.text = gls("Остановить");
         }
         else
         {
            this.§_-E1D§.field.text = gls("Записать");
         }
      }
      
      private function §_-II§(param1:MouseEvent) : void
      {
         §_-c0§.actions = this.§_-s1U§[(param1.currentTarget as §_-22V§).userData];
         §_-c0§.§_-k25§(this.§_-Zb§);
         §_-c0§.§_-L1C§();
         this.game.§_-731§();
         hide();
         this.§_-6l§.visible = true;
      }
      
      private function §_-Zb§() : void
      {
         this.game.§_-V2z§();
         this.show();
         this.§_-6l§.visible = false;
      }
   }
}

