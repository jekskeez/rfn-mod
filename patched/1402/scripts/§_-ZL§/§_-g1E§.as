package §_-ZL§
{
   import §_-B1G§.§_-U1c§;
   import §_-bN§.Dialog;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-Kb§;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-EP§;
   
   public class §_-g1E§ extends Dialog
   {
      
      private static const §_-A3C§:int = 10;
      
      private static const §_-S9§:int = 220;
      
      private static const §_-e2q§:int = 200;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","color: #000000;","}",".link {","color: #000000;","text-decoration: underline;","font-size: 12px;","}"].join("\n");
      
      private static var _instance:§_-g1E§ = null;
      
      private var list:§_-U1c§;
      
      private var §_-F28§:Object = {};
      
      private var §_-z2t§:Array = null;
      
      private var §_-f2t§:§_-i5§ = null;
      
      private var §_-M14§:§_-i5§ = null;
      
      private var locationId:int;
      
      private var §_-3O§:int;
      
      public function §_-g1E§()
      {
         _instance = this;
         super(gls("Лаги карт"));
         this.init();
      }
      
      public static function show(param1:int, param2:Array, param3:int) : void
      {
         if(!_instance)
         {
            new §_-g1E§();
         }
         _instance.§_-z2t§ = param2;
         _instance.locationId = param1;
         _instance.§_-3O§ = param3;
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.list.removeAll();
         this.§_-M14§.text = "";
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-02u§]);
         this.§_-u2W§(this.§_-z2t§.pop());
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-02u§]);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.list = new §_-U1c§(§_-S9§,§_-e2q§);
         this.list.x = §_-A3C§;
         this.list.y = 10;
         addChild(this.list);
         this.§_-M14§ = new §_-i5§("",§_-A3C§,this.list.y + §_-e2q§ + 8,new TextFormat(§_-i5§.§_-c10§,12,6175017));
         addChild(this.§_-M14§);
         this.§_-f2t§ = new §_-i5§(gls("<body><a href=\'event:\' class=\'link\'>Редактировать</a></body>"),§_-A3C§ + 120,this.§_-M14§.y,_loc1_);
         this.§_-f2t§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-H1h§);
         addChild(this.§_-f2t§);
         place();
         this.width += 25;
         this.height += 75;
      }
      
      private function §_-u2W§(param1:Object) : void
      {
         var _loc2_:int = int(String(param1["label"]).split(" ")[0]);
         var _loc3_:Object = {
            "label":_loc2_,
            "bold":true
         };
         this.§_-F28§[_loc2_] = _loc3_;
         Connection.§_-e2T§(§_-u1O§.§_-n2D§,_loc2_);
      }
      
      private function §_-O2I§(param1:int, param2:int) : void
      {
         this.§_-F28§[param1]["label"] += gls("   Лаги: {0}",param2);
         if(param2 >= §_-EP§.§_-r1F§)
         {
            this.§_-F28§[param1]["marked"] = true;
         }
         this.§_-F28§[param1]["forSort"] = param2;
         this.list.addItem(this.§_-F28§[param1]);
         this.list.§_-r2Z§("forSort",Array.DESCENDING | Array.NUMERIC);
         delete this.§_-F28§[param1];
         this.§_-M14§.text = gls("Кол-во карт: {0}\nКол-во непроверенных карт: {1}",this.list.length,this.§_-z2t§.length);
         if(this.§_-z2t§.length == 0)
         {
            this.§_-M14§.text = gls("Кол-во карт: {0}\nВсе карты проверены",this.list.length);
            return;
         }
         this.§_-u2W§(this.§_-z2t§.pop());
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = int(param1[0]);
         if(!(_loc2_ in this.§_-F28§))
         {
            return;
         }
         var _loc3_:§_-Kb§ = new §_-Kb§();
         _loc3_.number = _loc2_;
         _loc3_.load(param1.slice(1,param1.length));
         §_-EP§.§_-u2W§(_loc3_,this.§_-O2I§);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         var _loc2_:Object = this.list.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         (SquirrelGame.instance as §_-62b§).§_-S1Y§(this.locationId,_loc2_["value"],§_-at§.§_-L1l§,this.§_-3O§);
         §_-Ti§.§_-X2b§();
         GameSounds.play(§_-RH§.CLICK);
         param1.stopImmediatePropagation();
      }
   }
}

