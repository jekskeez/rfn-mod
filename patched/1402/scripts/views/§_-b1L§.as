package views
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import utils.StringUtil;
   import utils.§_-r1G§;
   
   public class §_-b1L§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","text-decoration: underline;","}","a {","font-family: \"" + §_-i5§.§_-c10§ + "\";","}","a:hover {","text-decoration: underline;","}",".self {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #660000;","}",".bold {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      public var id:int = 0;
      
      private var §_-73n§:§_-i5§;
      
      private var §_-N2m§:§_-i5§;
      
      private var §_-Z2j§:§_-i5§;
      
      private var §_-rM§:§_-i5§;
      
      private var §_-626§:§_-i5§;
      
      public function §_-b1L§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function set number(param1:int) : void
      {
         this.§_-73n§.text = param1.toString();
         this.§_-73n§.x = 5 - int(this.§_-73n§.textWidth * 0.5);
      }
      
      public function set playerName(param1:String) : void
      {
         var _loc2_:String = StringUtil.§_-hB§(param1,175);
         if(this.id == Game.selfId)
         {
            this.§_-N2m§.text = "<body><span class=\'self\'>" + §_-r1G§.§_-fU§(_loc2_,"event:" + this.id) + "</span></body>";
         }
         else
         {
            this.§_-N2m§.text = "<body>" + §_-r1G§.§_-fU§(_loc2_,"event:" + this.id) + "</body>";
         }
      }
      
      public function set §_-23Y§(param1:int) : void
      {
         this.§_-rM§.text = param1.toString();
         this.§_-rM§.x = 250 - int(this.§_-rM§.textWidth * 0.5);
      }
      
      public function get §_-23Y§() : int
      {
         return int(this.§_-rM§.text);
      }
      
      public function set samples(param1:int) : void
      {
         this.§_-Z2j§.text = param1.toString();
         this.§_-Z2j§.x = 160 - int(this.§_-Z2j§.textWidth * 0.5);
      }
      
      public function get samples() : int
      {
         return int(this.§_-Z2j§.text);
      }
      
      public function set rating(param1:int) : void
      {
         this.§_-626§.text = param1.toString();
         this.§_-626§.x = 350 - int(this.§_-626§.textWidth * 0.5);
      }
      
      public function get rating() : int
      {
         return int(this.§_-626§.text);
      }
      
      public function setData(param1:Object) : void
      {
         this.samples = param1["samples"];
         this.§_-23Y§ = param1["exp"];
         this.rating = param1["rating"];
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,0,true);
         this.§_-73n§ = new §_-i5§("",0,0,_loc2_);
         addChild(this.§_-73n§);
         this.§_-N2m§ = new §_-i5§("",15,0,_loc1_);
         this.§_-N2m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
         addChild(this.§_-N2m§);
         this.§_-Z2j§ = new §_-i5§("",160,0,_loc2_);
         addChild(this.§_-Z2j§);
         this.§_-rM§ = new §_-i5§("",250,0,_loc2_);
         addChild(this.§_-rM§);
         this.§_-626§ = new §_-i5§("",350,0,_loc2_);
         addChild(this.§_-626§);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = param1.currentTarget as §_-i5§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-cD§.§_-e25§(this.id);
      }
   }
}

