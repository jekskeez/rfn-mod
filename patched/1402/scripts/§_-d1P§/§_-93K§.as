package §_-d1P§
{
   import §_-B1G§.§_-32t§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   import utils.§_-jb§;
   
   public class §_-93K§ extends Dialog
   {
      
      private static const §_-A3C§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #262626;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-wM§:§_-32t§ = new §_-32t§(240);
      
      private var §_-R1h§:CheckBox = new CheckBox();
      
      public var playerId:int = 0;
      
      public function §_-93K§()
      {
         super(gls("Заблокировать"));
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-wM§.§_-JZ§ = this.§_-wM§.length > 1 ? 1 : 0;
         this.§_-R1h§.selected = false;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         addChild(new §_-i5§(gls("Укажите нарушение:"),§_-A3C§,5,new TextFormat(null,12,2500134)));
         this.§_-wM§.x = §_-A3C§;
         this.§_-wM§.y = 23;
         this.§_-E4§(this.§_-wM§);
         addChild(this.§_-wM§);
         §_-L2J§.§_-61Q§(this.§_-R1h§);
         this.§_-R1h§.x = §_-A3C§;
         this.§_-R1h§.y = 50;
         this.§_-R1h§.width = 370;
         this.§_-R1h§.label = gls("Такое нарушение уже было     ");
         addChild(this.§_-R1h§);
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Ок"));
         _loc2_.addEventListener(MouseEvent.CLICK,this.ban);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Отмена"));
         _loc3_.addEventListener(MouseEvent.CLICK,hide);
         place(_loc2_,_loc3_);
         this.height = 180;
         this.width = 310;
      }
      
      private function §_-E4§(param1:§_-32t§) : void
      {
         var _loc3_:Object = null;
         param1.removeAll();
         var _loc2_:int = 0;
         while(_loc2_ < §_-jb§.§_-JY§.length)
         {
            _loc3_ = §_-jb§.§_-JY§[_loc2_];
            if(!(Boolean("hide" in _loc3_) && Boolean(_loc3_["hide"]) && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§)))
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
         var _loc2_:int = int(this.§_-wM§.§_-E2v§["value"]);
         Connection.§_-e2T§(§_-u1O§.§_-x1i§,this.playerId,_loc2_,this.§_-R1h§.selected ? 1 : 0);
         hide();
      }
   }
}

