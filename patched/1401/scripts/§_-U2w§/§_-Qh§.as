package §_-U2w§
{
   import §_-Kr§.§_-h1x§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   import utils.§_-d1C§;
   import utils.§_-vo§;
   
   public class §_-Qh§ extends Dialog
   {
      
      private static const §_-V0§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #262626;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-C30§:§_-h1x§ = new §_-h1x§(240);
      
      private var §_-uX§:CheckBox = new CheckBox();
      
      public var playerId:int = 0;
      
      public function §_-Qh§()
      {
         super(gls("Заблокировать"));
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-C30§.§_-Uf§ = this.§_-C30§.length > 1 ? 1 : 0;
         this.§_-uX§.selected = false;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         addChild(new §_-22V§(gls("Укажите нарушение:"),§_-V0§,5,new TextFormat(null,12,2500134)));
         this.§_-C30§.x = §_-V0§;
         this.§_-C30§.y = 23;
         this.§_-a2T§(this.§_-C30§);
         addChild(this.§_-C30§);
         §_-vo§.§_-l1V§(this.§_-uX§);
         this.§_-uX§.x = §_-V0§;
         this.§_-uX§.y = 50;
         this.§_-uX§.width = 370;
         this.§_-uX§.label = gls("Такое нарушение уже было     ");
         addChild(this.§_-uX§);
         var _loc2_:§_-j18§ = new §_-j18§(gls("Ок"));
         _loc2_.addEventListener(MouseEvent.CLICK,this.ban);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Отмена"));
         _loc3_.addEventListener(MouseEvent.CLICK,hide);
         place(_loc2_,_loc3_);
         this.height = 180;
         this.width = 310;
      }
      
      private function §_-a2T§(param1:§_-h1x§) : void
      {
         var _loc3_:Object = null;
         param1.removeAll();
         var _loc2_:int = 0;
         while(_loc2_ < §_-d1C§.§_-ZN§.length)
         {
            _loc3_ = §_-d1C§.§_-ZN§[_loc2_];
            if(!(Boolean("hide" in _loc3_) && Boolean(_loc3_["hide"]) && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§)))
            {
               param1.addItem({
                  "label":_loc3_["title"],
                  "value":_loc2_
               });
            }
            _loc2_++;
         }
      }
      
      private function ban(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.§_-C30§.§_-l1§["value"]);
         Connection.§_-Li§(§_-h2B§.§_-N29§,this.playerId,_loc2_,this.§_-uX§.selected ? 1 : 0);
         hide();
      }
   }
}

