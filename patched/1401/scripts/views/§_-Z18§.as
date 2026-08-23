package views
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-xm§.§_-n1a§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.§_-S2I§;
   import utils.§_-vo§;
   
   public class §_-Z18§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #ffffff;","font-weight: bold;","}","a {","text-decoration: none;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var §_-81t§:Clan = null;
      
      private var §_-V2v§:§_-22V§;
      
      private var clanEmblem:§_-Z2N§;
      
      public function §_-Z18§()
      {
         super();
         this.init();
      }
      
      public function set clanId(param1:int) : void
      {
         if(this.§_-81t§ != null)
         {
            this.§_-81t§.removeEventListener(this.onClanLoaded);
            this.§_-81t§ = null;
         }
         if(param1 == 0)
         {
            this.visible = false;
            return;
         }
         this.§_-81t§ = §_-e2W§.§_-W2X§(param1);
         this.§_-81t§.addEventListener(§_-Oy§.§_-g2n§,this.onClanLoaded);
         §_-e2W§.request(param1,§_-Oy§.§_-g2n§,false);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:DisplayObject = new ButtonClan().upState;
         _loc2_.x = 30;
         _loc2_.y = 10;
         addChild(_loc2_);
         this.§_-V2v§ = new §_-22V§("",75,0,_loc1_);
         this.§_-V2v§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-P2v§);
         addChild(this.§_-V2v§);
         this.clanEmblem = new §_-Z2N§("",52,2,20);
         addChild(this.clanEmblem);
      }
      
      private function onClanLoaded(param1:Clan, param2:uint) : void
      {
         if(Boolean(param2) && Boolean(param1))
         {
         }
         this.visible = this.§_-81t§.state == §_-S2I§.§_-Wr§;
         if(this.§_-81t§.state != §_-S2I§.§_-Wr§)
         {
            return;
         }
         §_-vo§.§_-A2B§(this.§_-V2v§,this.§_-81t§.name,130,true,true,this.§_-81t§.id);
         this.clanEmblem.load(this.§_-81t§.§_-cy§);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-n1a§.show(this.§_-81t§.id);
      }
   }
}

