package §_-A2j§
{
   import §_-k1c§.Dialog;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   
   public class §_-4b§ extends §_-wP§
   {
      
      public var §_-Uk§:§_-22V§ = null;
      
      public var §_-P1z§:§_-22V§ = null;
      
      private var §_-Lw§:Sprite = new Sprite();
      
      public function §_-4b§()
      {
         super(4,1,25,65,10,10,210,280);
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-A3s§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-Uk§.text = §_-y1§.§_-bh§(param1.id);
         this.§_-P1z§.text = §_-y1§.§_-l7§(param1.id);
         while(this.§_-Lw§.numChildren > 0)
         {
            this.§_-Lw§.removeChildAt(0);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         addChildAt(new ImageShopPotionBack(),0);
         this.§_-Uk§ = new §_-22V§("",30,398,Dialog.FORMAT_CAPTION_16);
         this.§_-Uk§.filters = Dialog.§_-m2A§;
         addChild(this.§_-Uk§);
         this.§_-P1z§ = new §_-22V§("",30,430,new TextFormat(§_-22V§.§_-F2z§,14,6829595,true));
         addChild(this.§_-P1z§);
         addChild(this.§_-Lw§);
      }
   }
}

