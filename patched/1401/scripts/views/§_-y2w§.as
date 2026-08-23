package views
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.StringUtil;
   import utils.§_-xb§;
   
   public class §_-y2w§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","text-decoration: underline;","}","a {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","}","a:hover {","text-decoration: underline;","}",".self {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #660000;","}",".bold {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      public var id:int = 0;
      
      private var §_-wh§:§_-22V§;
      
      private var §_-Uk§:§_-22V§;
      
      private var §_-zH§:§_-22V§;
      
      private var §_-31T§:§_-22V§;
      
      private var §_-I1F§:§_-22V§;
      
      public function §_-y2w§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function set number(param1:int) : void
      {
         this.§_-wh§.text = param1.toString();
         this.§_-wh§.x = 5 - int(this.§_-wh§.textWidth * 0.5);
      }
      
      public function set playerName(param1:String) : void
      {
         var _loc2_:String = StringUtil.§_-uc§(param1,175);
         if(this.id == Game.selfId)
         {
            this.§_-Uk§.text = "<body><span class=\'self\'>" + §_-xb§.§_-e1r§(_loc2_,"event:" + this.id) + "</span></body>";
         }
         else
         {
            this.§_-Uk§.text = "<body>" + §_-xb§.§_-e1r§(_loc2_,"event:" + this.id) + "</body>";
         }
      }
      
      public function set §_-Lx§(param1:int) : void
      {
         this.§_-31T§.text = param1.toString();
         this.§_-31T§.x = 250 - int(this.§_-31T§.textWidth * 0.5);
      }
      
      public function get §_-Lx§() : int
      {
         return int(this.§_-31T§.text);
      }
      
      public function set samples(param1:int) : void
      {
         this.§_-zH§.text = param1.toString();
         this.§_-zH§.x = 160 - int(this.§_-zH§.textWidth * 0.5);
      }
      
      public function get samples() : int
      {
         return int(this.§_-zH§.text);
      }
      
      public function set rating(param1:int) : void
      {
         this.§_-I1F§.text = param1.toString();
         this.§_-I1F§.x = 350 - int(this.§_-I1F§.textWidth * 0.5);
      }
      
      public function get rating() : int
      {
         return int(this.§_-I1F§.text);
      }
      
      public function setData(param1:Object) : void
      {
         this.samples = param1["samples"];
         this.§_-Lx§ = param1["exp"];
         this.rating = param1["rating"];
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,0,true);
         this.§_-wh§ = new §_-22V§("",0,0,_loc2_);
         addChild(this.§_-wh§);
         this.§_-Uk§ = new §_-22V§("",15,0,_loc1_);
         this.§_-Uk§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
         addChild(this.§_-Uk§);
         this.§_-zH§ = new §_-22V§("",160,0,_loc2_);
         addChild(this.§_-zH§);
         this.§_-31T§ = new §_-22V§("",250,0,_loc2_);
         addChild(this.§_-31T§);
         this.§_-I1F§ = new §_-22V§("",350,0,_loc2_);
         addChild(this.§_-I1F§);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = param1.currentTarget as §_-22V§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-927§.§_-i2I§(this.id);
      }
   }
}

