package §_-q24§
{
   import §_-bN§.Dialog;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   
   public class §_-w1e§ extends §_-S1M§
   {
      
      public var §_-N2m§:§_-i5§ = null;
      
      public var §_-73F§:§_-i5§ = null;
      
      private var §_-v1F§:Sprite = new Sprite();
      
      public function §_-w1e§()
      {
         super(4,1,25,65,10,10,210,280);
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-2n§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-N2m§.text = §_-sL§.§_-3f§(param1.id);
         this.§_-73F§.text = §_-sL§.§_-ya§(param1.id);
         while(this.§_-v1F§.numChildren > 0)
         {
            this.§_-v1F§.removeChildAt(0);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         addChildAt(new ImageShopPotionBack(),0);
         this.§_-N2m§ = new §_-i5§("",30,398,Dialog.FORMAT_CAPTION_16);
         this.§_-N2m§.filters = Dialog.§_-q2I§;
         addChild(this.§_-N2m§);
         this.§_-73F§ = new §_-i5§("",30,430,new TextFormat(§_-i5§.§_-c10§,14,6829595,true));
         addChild(this.§_-73F§);
         addChild(this.§_-v1F§);
      }
   }
}

