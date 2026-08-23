package §_-Q1P§
{
   import §_-Kr§.§_-12w§;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-g1L§;
   import §_-k1c§.Dialog;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-qd§;
   
   public class §_-03E§ extends Dialog
   {
      
      private static const §_-V0§:int = 10;
      
      private static const §_-y1X§:int = 220;
      
      private static const §_-92X§:int = 200;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","color: #000000;","}",".link {","color: #000000;","text-decoration: underline;","font-size: 12px;","}"].join("\n");
      
      private static var _instance:§_-03E§ = null;
      
      private var list:§_-12w§;
      
      private var §_-k2z§:Object = {};
      
      private var §_-J2c§:Array = null;
      
      private var §_-X19§:§_-22V§ = null;
      
      private var §_-i2M§:§_-22V§ = null;
      
      private var locationId:int;
      
      private var §_-01L§:int;
      
      public function §_-03E§()
      {
         _instance = this;
         super(gls("Невидимые объекты"));
         this.init();
      }
      
      public static function show(param1:int, param2:Array, param3:int) : void
      {
         if(!_instance)
         {
            new §_-03E§();
         }
         _instance.§_-J2c§ = param2;
         _instance.locationId = param1;
         _instance.§_-01L§ = param3;
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.list.removeAll();
         this.§_-i2M§.text = "";
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-pN§]);
         this.§_-213§(this.§_-J2c§.pop());
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-pN§]);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.list = new §_-12w§(§_-y1X§,§_-92X§);
         this.list.x = §_-V0§;
         this.list.y = 10;
         addChild(this.list);
         this.§_-i2M§ = new §_-22V§("",§_-V0§,this.list.y + §_-92X§ + 8,new TextFormat(§_-22V§.§_-F2z§,12,6175017));
         addChild(this.§_-i2M§);
         this.§_-X19§ = new §_-22V§(gls("<body><a href=\'event:\' class=\'link\'>Редактировать</a></body>"),§_-V0§ + 120,this.§_-i2M§.y,_loc1_);
         this.§_-X19§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-P2v§);
         addChild(this.§_-X19§);
         place();
         this.width += 25;
         this.height += 75;
      }
      
      private function §_-213§(param1:Object) : void
      {
         var _loc2_:int = int(String(param1["label"]).split(" ")[0]);
         var _loc3_:Object = {
            "label":_loc2_,
            "value":_loc2_,
            "bold":true
         };
         this.§_-k2z§[_loc2_] = _loc3_;
         Connection.§_-Li§(§_-h2B§.§_-V2T§,_loc2_);
      }
      
      private function §_-41J§(param1:int, param2:int) : void
      {
         if(param2 != 0)
         {
            this.§_-k2z§[param1]["label"] += gls("   Невидимых: {0}",param2);
            this.§_-k2z§[param1]["forSort"] = param2;
            this.list.addItem(this.§_-k2z§[param1]);
            this.list.§_-yy§("forSort",Array.DESCENDING | Array.NUMERIC);
         }
         delete this.§_-k2z§[param1];
         this.§_-i2M§.text = gls("Кол-во карт: {0}\nКол-во непроверенных карт: {1}",this.list.length,this.§_-J2c§.length);
         if(this.§_-J2c§.length == 0)
         {
            this.§_-i2M§.text = gls("Кол-во карт: {0}\nВсе карты проверены",this.list.length);
            return;
         }
         this.§_-213§(this.§_-J2c§.pop());
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = int(param1[0]);
         if(!(_loc2_ in this.§_-k2z§))
         {
            return;
         }
         var _loc3_:§_-g1L§ = new §_-g1L§();
         _loc3_.number = _loc2_;
         _loc3_.load(param1.slice(1,param1.length));
         §_-qd§.§_-yD§(_loc3_,this.§_-41J§);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var _loc2_:Object = this.list.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         (SquirrelGame.instance as §_-A32§).§_-Ao§(this.locationId,_loc2_["value"],§_-q1p§.§_-8Z§,this.§_-01L§);
         §_-UC§.§_-B3B§();
         GameSounds.play(§_-43Z§.CLICK);
         param1.stopImmediatePropagation();
      }
   }
}

